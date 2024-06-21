from utils.DateFormat import DateFormat
class Tipo_usuario():
    def __init__(self,cod_tipo_usuario,descripcion,rol, fecha_asignacion):
        self.cod_tipo_usuario = cod_tipo_usuario
        self.descripcion = descripcion
        self.rol = rol
        self.fecha_asignacion = fecha_asignacion
      
        
    
    def to_JSON(self):
        return{
            'cod_tipo_usuario': self.cod_tipo_usuario,
            'descripcion': self.descripcion,
            'rol': self.rol,
            'fecha_asignacion': DateFormat.convert_date_type1(self.fecha_asignacion)
        }
    
    
        
