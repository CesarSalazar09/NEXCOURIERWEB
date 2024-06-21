from utils.DateFormat import DateFormat
class Tipo_deduccion():
    def __init__(self,descripcion, categoria, cod_tipo_deduccion, porcentaje):
        self.descripcion = descripcion
        self.categoria = categoria
        self.cod_tipo_deduccion = cod_tipo_deduccion
        self.porcentaje = porcentaje     
        
    
    def to_JSON(self):
        return{
            'descripcion': self.descripcion,
            'categoria': self.categoria,
            'cod_tipo_deduccion': self.cod_tipo_deduccion,
            'porcentaje': self.porcentaje,
        }
    
    
        