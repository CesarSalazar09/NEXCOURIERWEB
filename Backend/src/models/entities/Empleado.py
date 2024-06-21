from utils.DateFormat import DateFormat

class Empleado():

    def __init__(self, dni, primer_nombre, 
                 segundo_nombre, primer_apellido, segundo_apellido, correo_empresa, telefono, 
                 ubigeo, nombre_direccion, tipo_zona_direccion, sueldo_base, fecha_contrato, 
                 asignacion_familiar, planilla, cod_puesto, cod_departamento, cod_sueldo,
                 bono_desempeno,pago_utilidades,movilidad,pago_suplencia,pago_especiales,cts,afp):
        self.dni = dni
        self.primer_nombre = primer_nombre
        self.segundo_nombre = segundo_nombre
        self.primer_apellido = primer_apellido
        self.segundo_apellido = segundo_apellido
        self.correo_empresa = correo_empresa
        self.telefono = telefono
        self.ubigeo = ubigeo
        self.nombre_direccion = nombre_direccion
        self.tipo_zona_direccion = tipo_zona_direccion
        self.sueldo_base = sueldo_base
        self.fecha_contrato = fecha_contrato
        self.asignacion_familiar = asignacion_familiar
        self.planilla = planilla
        self.cod_puesto = cod_puesto
        self.cod_departamento = cod_departamento
        self.cod_sueldo = cod_sueldo 
        self.bono_desempeno=bono_desempeno
        self.pago_utilidades=pago_utilidades
        self.movilidad=movilidad 
        self.pago_suplencia=pago_suplencia
        self.pago_especiales=pago_especiales
        self.cts=cts
        self.afp=afp
    
    def to_JSON(self):
        return {
            'dni': self.dni,
            'primer_nombre': self.primer_nombre,
            'segundo_nombre': self.segundo_nombre,
            'primer_apellido': self.primer_apellido,
            'segundo_apellido': self.segundo_apellido,
            'correo_empresa': self.correo_empresa,
            'telefono': self.telefono,
            'ubigeo': self.ubigeo,
            'nombre_direccion': self.nombre_direccion,
            'tipo_zona_direccion': self.tipo_zona_direccion,
            'sueldo_base': self.sueldo_base,
            'fecha_contrato': DateFormat.convert_date_type1(self.fecha_contrato),
            'asignacion_familiar': self.asignacion_familiar,
            'planilla': self.planilla,
            'cod_puesto': self.cod_puesto,
            'cod_departamento': self.cod_departamento,
            'cod_sueldo': self.cod_sueldo,
            'bono_desempeno': self.bono_desempeno,
            'pago_utilidades': self.pago_utilidades,
            'movilidad': self.movilidad,
            'pago_suplencia': self.pago_suplencia,
            'pago_especiales': self.pago_especiales,
            'cts': self.cts,
            'afp': self.afp
        }