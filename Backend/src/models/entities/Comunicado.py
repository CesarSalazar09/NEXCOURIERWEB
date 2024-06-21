from utils.DateFormat import DateFormat
class Comunicado():

    def __init__(self, cod_comunicado, descripcion, url_documento,fecha,cod_usuario):
        self.cod_comunicado = cod_comunicado
        self.descripcion = descripcion
        self.url_documento = url_documento
        self.fecha = fecha
        self.cod_usuario = cod_usuario
    
    def to_JSON(self):
        return {
            'cod_comunicado': self.cod_comunicado,
            'descripcion': self.descripcion,
            'url_documento': self.url_documento,
            'fecha': DateFormat.convert_date_type1(self.fecha),
            'cod_usuario': self.cod_usuario
        }