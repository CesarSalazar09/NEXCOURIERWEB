from database.db import get_connection
from .entities.Deduccion import Deduccion

class DeduccionModel():

    @classmethod
    def get_deducciones(self):
        try:
            connection = get_connection()
            deducciones = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Deduccion')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    deduccion = Deduccion(row[0], row[1], row[2], row[3], row[4])
                    deducciones.append(deduccion.to_JSON())

                connection.close()
                return deducciones
        except Exception as ex:
            raise Exception(ex)