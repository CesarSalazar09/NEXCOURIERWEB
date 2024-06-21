from database.db import get_connection
from .entities.Empleado import Empleado

class EmpleadoModel():

    @classmethod
    def get_empleados(cls, dni=None, fecha_contrato=None, primer_apellido=None):
        try:
            connection = get_connection()
            empleados = []
            with connection.cursor() as cursor:
                query = 'SELECT * FROM Empleado WHERE 1=1'
                parameters = []
                
                if dni:
                    query += ' AND dni = %s'
                    parameters.append(dni)
                
                if fecha_contrato:
                    query += ' AND fecha_contrato = %s'
                    parameters.append(fecha_contrato)

                if primer_apellido:
                    query += ' AND primer_apellido = %s'
                    parameters.append(primer_apellido)

                cursor.execute(query, parameters)
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    empleado = Empleado(row[0], row[1], row[2], row[3], row[4], row[5], row[6],
                                        row[7], row[8], row[9], row[10], row[11], row[12], row[13],
                                        row[14], row[15], row[16], row[17], row[18], row[19], row[20], row[21], row[22], row[23])
                    empleados.append(empleado.to_JSON())

                connection.close()
                return empleados
        except Exception as ex:
            raise Exception(ex)
        
    @classmethod
    def add_empleado(self, empleado):
        try:
            connection = get_connection()
            with connection.cursor() as cursor:
                cursor.execute('INSERT INTO Empleado (dni, primer_nombre, segundo_nombre, primer_apellido, segundo_apellido, correo_empresa, telefono, ubigeo, nombre_direccion, tipo_zona_direccion, sueldo_base, fecha_contrato, asignacion_familiar, planilla, cod_puesto, cod_departamento, cod_sueldo) VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%d,%d,%d)',
                                (empleado.dni, empleado.primer_nombre, empleado.segundo_nombre, empleado.primer_apellido, empleado.segundo_apellido, empleado.correo_empresa, empleado.telefono, empleado.ubigeo, empleado.nombre_direccion, empleado.tipo_zona_direccion, empleado.sueldo_base, empleado.fecha_contrato, empleado.asignacion_familiar, empleado.planilla, empleado.cod_puesto, empleado.cod_departamento, empleado.cod_sueldo))
                affected_rows = cursor.rowcount
                connection.commit()
            
            connection.close()
            return affected_rows
        except Exception as ex:
            raise Exception(ex)
        
    @classmethod
    def get_nomina(self):
        try:
            connection = get_connection()
            nominas = []
            with connection.cursor() as cursor:
                cursor.execute("""
                CREATE TEMPORARY TABLE Temp_Nomina (
                dni CHAR(8),
                monto NUMERIC(10, 2),
                cod_sueldo CHAR(8)
                );


                CREATE OR REPLACE FUNCTION gestionar_nomina() RETURNS VOID AS $$
                DECLARE
                registro CURSOR FOR
                    SELECT E.dni
                    FROM Empleado E
                    GROUP BY E.dni;
                dni_trabajador CHAR(8);
                empleado_sueldo_base NUMERIC(7,3);
                empleado_asignacion_familiar BOOLEAN;
                empleado_planilla BOOLEAN;
                empleado_cod_sueldo CHAR(8);
                monto_nomina NUMERIC(10,2);
                monto_descuentos NUMERIC(10,2);
                monto_beneficios NUMERIC(10,2);
                BEGIN
                OPEN registro;
                LOOP
                    FETCH registro INTO dni_trabajador;
                    EXIT WHEN NOT FOUND;

                    SELECT sueldo_base, asignacion_familiar, planilla, cod_sueldo INTO empleado_sueldo_base, empleado_asignacion_familiar, empleado_planilla, empleado_cod_sueldo
                    FROM Empleado
                    WHERE dni = dni_trabajador;

                    SELECT COALESCE(SUM(CASE WHEN TD.categoria = 'Seguridad Social' THEN TD.porcentaje ELSE 0 END), 0) INTO monto_descuentos
                    FROM Deduccion D
                    LEFT JOIN tipo_deduccion TD ON D.cod_deduccion = TD.cod_deduccion
                    WHERE D.cod_sueldo = empleado_cod_sueldo AND D.estado_deduccion = 'Activa';

                    SELECT COALESCE(SUM(CASE WHEN TB.categoria = 'Planilla' THEN TB.porcentaje ELSE 0 END), 0) INTO monto_beneficios
                    FROM Beneficio B
                    LEFT JOIN tipo_beneficio TB ON B.cod_beneficio = TB.cod_beneficio
                    WHERE B.cod_sueldo = empleado_cod_sueldo AND B.estado_beneficio = 'Activo';

                    monto_nomina := empleado_sueldo_base;

                    IF monto_descuentos > 0 THEN
                    monto_nomina := monto_nomina - (monto_nomina * monto_descuentos / 100);
                    END IF;

                    IF empleado_asignacion_familiar THEN
                    monto_nomina := monto_nomina + (monto_nomina * 0.05);
                    END IF;

                    IF empleado_planilla THEN
                    monto_nomina := monto_nomina + (monto_nomina * 0.105);
                    END IF;

                    INSERT INTO Temp_Nomina (dni, monto, cod_sueldo) VALUES (dni_trabajador, monto_nomina, empleado_cod_sueldo);
                END LOOP;

                CLOSE registro;
                END;
                $$ LANGUAGE plpgsql;

                SELECT gestionar_nomina();
                SELECT * FROM Temp_Nomina;
                """)
                records = cursor.fetchall()
                for row in records:
                    nomina = {
                        'dni': row[0],
                        'monto': row[1],
                        'cod_sueldo': row[2]
                    }
                    nominas.append(nomina)


                connection.close()
                return nominas
        except Exception as ex:
            raise Exception(ex)

