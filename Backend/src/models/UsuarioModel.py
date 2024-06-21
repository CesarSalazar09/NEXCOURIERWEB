from database.db import get_connection
from .entities.Usuario import Usuario

class UsuarioModel():
    @classmethod
    def get_usuario(self):
        try:
            connection = get_connection()
            usuarios = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Usuario')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    usuario = Usuario(row[0], row[1], row[2], row[3])
                    usuarios.append(usuario.to_JSON())
                    
                connection.close()
                return usuarios
        except Exception as ex:
            raise Exception(ex) 