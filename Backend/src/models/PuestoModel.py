from database.db import get_connection
from .entities.Puesto import Puesto

class PuestoModel():

    @classmethod
    def get_puestos(self):
        try:
            connection = get_connection()
            puestos = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Puesto')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    puesto = Puesto(row[0], row[1], row[2])
                    puestos.append(puesto.to_JSON())
                    
                connection.close()
                return puestos
        except Exception as ex:
            raise Exception(ex)