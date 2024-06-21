class Plataforma():

    def __init__(self, cod_plataforma, Cant_usos_exitosos, cant_usos_totales):
        self.cod_plataforma = cod_plataforma
        self.Cant_usos_exitosos = Cant_usos_exitosos
        self.cant_usos_totales = cant_usos_totales
    
    def to_JSON(self):
        return {
            'cod_plataforma': self.cod_plataforma,
            'Cant_usos_exitosos': self.Cant_usos_exitosos,
            'cant_usos_totales': self.cant_usos_totales
        }