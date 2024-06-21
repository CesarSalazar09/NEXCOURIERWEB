from utils.DateFormat import DateFormat
class Deduccion():

    def __init__(self,cod_deduccion, fecha_inicio, fecha_fin,estado_deduccion, cod_sueldo):
        self.cod_deduccion = cod_deduccion
        self.fecha_inicio = fecha_inicio
        self.fecha_fin = fecha_fin
        self.estado_deduccion = estado_deduccion
        self.cod_sueldo = cod_sueldo
    
    def to_JSON(self):
        return {
            'cod_deduccion': self.cod_deduccion,
            'fecha_inicio': DateFormat.convert_date_type2(self.fecha_inicio),
            'fecha_fin': DateFormat.convert_date_type2(self.fecha_fin),
            'estado_deduccion': self.estado_deduccion,
            'cod_sueldo': self.cod_sueldo
        }