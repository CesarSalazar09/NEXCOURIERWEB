from utils.DateFormat import DateFormat
class Usuario():
    def __init__(self,cod_usuario,contraseña, dni, cod_tipo_usuario):
        self.cod_usuario = cod_usuario
        self.contraseña = contraseña
        self.dni = dni
        self.cod_tipo_usuario = cod_tipo_usuario
      
        
    
    def to_JSON(self):
        return{
            'cod_usuario': self.cod_usuario,
            'password': self.contraseña,
            'dni': self.dni,
            'cod_tipo_usuario': self.cod_tipo_usuario
        }
    
    
        