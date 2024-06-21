from utils.DateFormat import DateFormat
import datetime
class Reporte():
    def __init__(self,cod_reporte,fecha_reporte,hora_reporte,fecha_inicio,fecha_final,cod_asistencia):
        self.cod_reporte = cod_reporte
        self.fecha_reporte = fecha_reporte
        self.hora_reporte = hora_reporte
        self.fecha_inicio = fecha_inicio
        self.fecha_final = fecha_final
        self.cod_asistencia = cod_asistencia
        
    
    def to_JSON(self):
        return{
            'cod_reporte': self.cod_reporte,
            'fecha_reporte': DateFormat.convert_date_type1(self.fecha_reporte),
            'hora_reporte': self.hora_reporte.strftime("%H:%M:%S"),
            'fecha_inicio': DateFormat.convert_date_type1(self.fecha_inicio),
            'fecha_final': DateFormat.convert_date_type1(self.fecha_final),
            'cod_asistencia': self.cod_asistencia
        }
    
    
        