class Departamento():

    def __init__(self, cod_departamento, nombre_departamento, descripcion):
        self.cod_departamento = cod_departamento
        self.nombre_departamento = nombre_departamento
        self.descripcion = descripcion
    
    def to_JSON(self):
        return {
            'cod_departamento': self.cod_departamento,
            'nombre_departamento': self.nombre_departamento,
            'descripcion': self.descripcion
        }
