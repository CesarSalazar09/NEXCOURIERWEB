class Asistencia():

    def __init__(self,cod_asistencia, fecha_hora_entrada, fecha_hora_salida,fecha_hora_inicio_refrigerio, fecha_hora_termino_refrigerio,cod_usuario):
        self.cod_asistencia = cod_asistencia
        self.fecha_hora_entrada = fecha_hora_entrada
        self.fecha_hora_salida = fecha_hora_salida
        self.fecha_hora_inicio_refrigerio = fecha_hora_inicio_refrigerio
        self.fecha_hora_termino_refrigerio = fecha_hora_termino_refrigerio
        self.cod_usuario = cod_usuario
    
    def to_JSON(self):
        return {
            'cod_asistencia': self.cod_asistencia,
            'fecha_hora_entrada': self.fecha_hora_entrada,
            'fecha_hora_salida': self.fecha_hora_salida,
            'fecha_hora_inicio_refrigerio': self.fecha_hora_inicio_refrigerio,
            'fecha_hora_termino_refrigerio': self.fecha_hora_termino_refrigerio,
            'cod_usuario': self.cod_usuario
        }