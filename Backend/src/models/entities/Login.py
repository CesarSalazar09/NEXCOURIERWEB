class Login():

    def __init__(self, Cod_login, Fecha_hora_inicio, Fecha_hora_fin,cod_plataforma,cod_usuario):
        self.Cod_login = Cod_login
        self.Fecha_hora_inicio= Fecha_hora_inicio
        self.Fecha_hora_fin= Fecha_hora_fin
        self.cod_plataforma = cod_plataforma
        self.cod_usuario = cod_usuario
    
    def to_JSON(self):
        return {
            'Cod_login': self.Cod_login,
            'Fecha_hora_inicio': self.Fecha_hora_inicio,
            'Fecha_hora_fin': self.Fecha_hora_fin,
            'cod_plataforma': self.cod_plataforma,
            'cod_usuario': self.cod_usuario
        }
