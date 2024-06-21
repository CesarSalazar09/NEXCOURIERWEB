from utils.DateFormat import DateFormat
class Beneficio():

    def __init__(self,cod_beneficio, fecha_inicio, fecha_fin,estado_beneficio, cod_sueldo):
        self.cod_beneficio = cod_beneficio
        self.fecha_inicio = fecha_inicio
        self.fecha_fin = fecha_fin
        self.estado_beneficio = estado_beneficio
        self.cod_sueldo = cod_sueldo
    
    def to_JSON(self):
        return {
            'cod_beneficio': self.cod_beneficio,
            'fecha_inicio': DateFormat.convert_date_type2(self.fecha_inicio),
            'fecha_fin': DateFormat.convert_date_type2(self.fecha_fin),
            'estado_beneficio': self.estado_beneficio,
            'cod_sueldo': self.cod_sueldo
        }