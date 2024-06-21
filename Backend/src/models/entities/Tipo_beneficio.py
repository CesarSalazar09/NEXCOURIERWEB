from utils.DateFormat import DateFormat
class Tipo_beneficio():
    def __init__(self,descripcion,categoria,cod_tipo_beneficio,porcentaje):
        self.descripcion = descripcion
        self.categoria = categoria
        self.cod_tipo_beneficio = cod_tipo_beneficio
        self.porcentaje = porcentaje
      
    
    def to_JSON(self):
        return{
            'descripcion': self.descripcion,
            'categoria': self.categoria,
            'cod_tipo_beneficio': self.cod_tipo_beneficio,
            'porcentaje': self.porcentaje,
        }
    
    
        