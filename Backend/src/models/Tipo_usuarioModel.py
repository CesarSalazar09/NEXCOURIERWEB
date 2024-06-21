from database.db import get_connection
from .entities.Tipo_usuario import Tipo_usuario

class Tipo_usuarioModel():
    @classmethod
    def get_tipo_usuario(self):
        try:
            connection = get_connection()
            tipo_usuarios = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Tipo_usuario')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    tipo_usuario = Tipo_usuario(row[0], row[1], row[2], row[3])
                    tipo_usuarios.append(tipo_usuario.to_JSON())
                    
                connection.close()
                return tipo_usuarios
        except Exception as ex:
            raise Exception(ex) 