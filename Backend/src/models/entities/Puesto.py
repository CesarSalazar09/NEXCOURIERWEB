class Puesto():
    
    def __init__(self,cod_puesto,nombre_puesto,descripcion):
        self.cod_puesto = cod_puesto
        self.nombre_puesto = nombre_puesto
        self.descripcion = descripcion
    
    def to_JSON(self):
        return{
        'cod_puesto': self.cod_puesto,
        'nombre_puesto': self.nombre_puesto,
        'descripcion': self.descripcion
        }



        