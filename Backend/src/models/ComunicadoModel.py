from database.db import get_connection
from .entities.Comunicado import Comunicado

class ComunicadoModel():

    @classmethod
    def get_comunicados(self):
        try:
            connection = get_connection()
            comunicados = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Comunicado')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    comunicado = Comunicado(row[0], row[1], row[2], row[3], row[4])
                    comunicados.append(comunicado.to_JSON())

                connection.close()
                return comunicados
        except Exception as ex:
            raise Exception(ex)