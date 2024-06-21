class ClienteEmpresa():

    def __init__(self, cod_cliente, nombre_cliente,descripcion, url_imagen,cod_usuario):
        self.cod_cliente = cod_cliente
        self.nombre_cliente = nombre_cliente
        self.descripcion = descripcion
        self.url_imagen = url_imagen
        self.cod_usuario = cod_usuario
    
    def to_JSON(self):
        return {
            'cod_cliente': self.cod_cliente,
            'nombre_cliente': self.nombre_cliente,
            'descripcion': self.descripcion,
            'url_imagen': self.url_imagen,
            'cod_usuario': self.cod_usuario
        }