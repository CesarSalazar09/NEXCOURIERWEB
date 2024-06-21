from database.db import get_connection
from .entities.Asistencia import Asistencia

class AsistenciaModel():

    @classmethod
    def get_asistencias(self):
        try:
            connection = get_connection()
            asistencias = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Asistencia')
                records = cursor.fetchall()
                print(records)
                for row in records:
                    asistencia = Asistencia(row[0], row[1], row[2], row[3], row[4], row[5])
                    asistencias.append(asistencia.to_JSON())

                connection.close()
                return asistencias
        except Exception as ex:
            raise Exception(ex)
    
    #Requerimiento 16
    @classmethod
    def get_promedio_horas(self):
        try:
            connection = get_connection()
            promedio_horas = []

            with connection.cursor() as cursor:
                cursor.execute("""
                SELECT EXTRACT(MONTH FROM fecha_hora_entrada) AS mes,
                AVG(EXTRACT(EPOCH FROM fecha_hora_salida - fecha_hora_entrada) / 3600 -
                    EXTRACT(EPOCH FROM fecha_hora_termino_refrigerio - fecha_hora_inicio_refrigerio) / 3600) AS promedio_horas
                    FROM Asistencia WHERE cod_usuario = 'USR00001' AND fecha_hora_entrada >= NOW() - INTERVAL '1 year'
                    GROUP BY EXTRACT(MONTH FROM fecha_hora_entrada)
                    ORDER BY EXTRACT(MONTH FROM fecha_hora_entrada);
                """)
                records = cursor.fetchall()
                print(records)
                for row in records:
                    mes = int(row[0])
                    promedio = float(row[1])
                    promedio_horas.append({'mes': mes, 'promedio_horas': promedio})

                connection.close()
                return promedio_horas
        except Exception as ex:
            raise Exception(ex)
    
    #Requerimiento 17
    @classmethod
    def get_horas_extra(self):
        try:
            connection = get_connection()
            horas_extra = []

            with connection.cursor() as cursor:
                cursor.execute("""
                SELECT
                EXTRACT(MONTH FROM fecha_hora_salida) AS mes,
                ROUND(AVG(EXTRACT(HOUR FROM (fecha_hora_salida - fecha_hora_entrada)) - 8.0), 2) AS promedio_horas_extras
                FROM
                Asistencia
                WHERE
                cod_usuario = 'USR00001'
                AND fecha_hora_entrada >= CURRENT_DATE - INTERVAL '1 year'
                GROUP BY
                mes;
                """)
                records = cursor.fetchall()
                print(records)
                for row in records:
                    mes = int(row[0])
                    promedio_horas_extras = float(row[1])
                    horas_extra.append({'mes': mes, 'horas_extra': promedio_horas_extras})

                connection.close()
                return horas_extra
        except Exception as ex:
            raise Exception(ex)

    #Requerimiento 18
    @classmethod
    def get_porcentaje_asistencia(self):
        try:
            connection = get_connection()
            porcentaje_asistencias = []

            with connection.cursor() as cursor:
                cursor.execute("""
                SELECT EXTRACT(MONTH FROM fecha_hora_entrada) AS mes,
                       COUNT(*) AS cantidad_asistencias,
                       (COUNT(*) * 100.0) / t1.total_asistencias AS porcentaje_asistencia
                FROM Asistencia, (
                  SELECT COUNT(*) AS total_asistencias
                  FROM Asistencia
                  WHERE cod_usuario = 'USR00001'
                    AND fecha_hora_entrada >= NOW() - INTERVAL '1 year'
                ) AS t1
                WHERE cod_usuario = 'USR00001'
                  AND fecha_hora_entrada >= NOW() - INTERVAL '1 year'
                  AND fecha_hora_entrada <= NOW()
                GROUP BY EXTRACT(MONTH FROM fecha_hora_entrada), t1.total_asistencias
                ORDER BY EXTRACT(MONTH FROM fecha_hora_entrada);
                """)
                records = cursor.fetchall()
                print(records)
                for row in records:
                    mes = int(row[0])
                    cantidad = int(row[1])
                    porcentaje = round(float(row[2]),2)

                    porcentaje_asistencias.append({'mes': mes, 'cantidad_asistencias': cantidad, 'porcentaje_asistencia': porcentaje})
                
                connection.close()
                return porcentaje_asistencias
        except Exception as ex:
            raise Exception(ex)

    #Requerimiento 19
    @classmethod
    def get_horas_trabajadas_departamento(self):
        try:
            connection = get_connection()
            horas_trabajadas = []

            with connection.cursor() as cursor:
                cursor.execute("""
                WITH horas_trabajadas AS (
                    SELECT
                        E.cod_departamento,
                        U.dni,
                        SUM(EXTRACT(HOUR FROM (A.fecha_hora_salida - A.fecha_hora_entrada))) AS total_horas_trabajadas
                    FROM
                        Asistencia A
                    INNER JOIN
                        Usuario U ON A.cod_usuario = U.cod_usuario
                    INNER JOIN
                        Empleado E ON U.dni = E.dni
                    WHERE
                        A.fecha_hora_entrada >= DATE_TRUNC('month', CURRENT_DATE - INTERVAL '1 month')
                        AND A.fecha_hora_entrada < DATE_TRUNC('month', CURRENT_DATE)
                    GROUP BY
                        E.cod_departamento,
                        U.dni
                    )
                    SELECT
                    E.primer_nombre || ' ' || E.primer_apellido AS empleado,
                    D.nombre_departamento AS departamento,
                    H.total_horas_trabajadas
                    FROM
                    horas_trabajadas H
                    INNER JOIN
                    Empleado E ON H.dni = E.dni
                    INNER JOIN
                    Departamento D ON H.cod_departamento = D.cod_departamento
                    WHERE
                    H.total_horas_trabajadas = (
                        SELECT
                        total_horas_trabajadas
                        FROM
                        horas_trabajadas
                        WHERE
                        cod_departamento = H.cod_departamento
                    );
                """)
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    empleado = str(row[0])
                    departamento = str(row[1])
                    horas = float(row[2])
                    horas_trabajadas.append({'empleado': empleado, 'departamento': departamento, 'horas_trabajadas': horas})
                
                connection.close()
                return horas_trabajadas
        except Exception as ex:
            raise Exception(ex)

    #Requerimiento 20
    @classmethod
    def get_horas_promedio_trabajadas(self):
        try:
            connection = get_connection()
            horas_trabajadas = []

            with connection.cursor() as cursor:
                cursor.execute("""
                SELECT d.cod_departamento, d.nombre_departamento,
                    AVG(EXTRACT(EPOCH FROM (a.fecha_hora_salida - a.fecha_hora_entrada - (a.fecha_hora_termino_refrigerio - a.fecha_hora_inicio_refrigerio)))) / 3600.0 AS horas_promedio_trabajadas
                FROM Asistencia AS a
                JOIN Usuario AS u ON a.cod_usuario = u.cod_usuario
                JOIN Empleado AS e ON u.dni = e.dni
                JOIN Departamento AS d ON e.cod_departamento = d.cod_departamento
                WHERE a.fecha_hora_entrada >= NOW() - INTERVAL '1 year'
                GROUP BY d.cod_departamento, d.nombre_departamento;
                """)
                records = cursor.fetchall()
                print(records)
                for row in records:
                    cod_departamento = str(row[0])
                    nombre_departamento = row[1]
                    horas_promedio = round(float(row[2]),2)

                    horas_trabajadas.append({'cod_departamento': cod_departamento, 'nombre_departamento': nombre_departamento, 'horas_promedio_trabajadas': horas_promedio})
                
                connection.close()
                return horas_trabajadas
        except Exception as ex:
            raise Exception(ex)
    
