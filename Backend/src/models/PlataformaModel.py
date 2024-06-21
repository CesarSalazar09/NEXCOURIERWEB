from database.db import get_connection
from .entities.Plataforma import Plataforma

class PlataformaModel():

    @classmethod
    def get_plataformas(self):
        try:
            connection = get_connection()
            plataformas = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM plataforma')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    plataforma = Plataforma(row[0], row[1], row[2])
                    plataformas.append(plataforma.to_JSON())

                connection.close()
                return plataformas
        except Exception as ex:
            raise Exception(ex)