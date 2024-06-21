from database.db import get_connection
from .entities.Beneficio import Beneficio

class BeneficioModel():

    @classmethod
    def get_beneficios(self):
        try:
            connection = get_connection()
            beneficios = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Beneficio')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    beneficio = Beneficio(row[0], row[1], row[2], row[3], row[4])
                    beneficios.append(beneficio.to_JSON())

                connection.close()
                return beneficios
        except Exception as ex:
            raise Exception(ex)