from database.db import get_connection
from .entities.Sueldo import Sueldo

class SueldoModel():
    @classmethod
    def get_sueldos(self):
        try:
            connection = get_connection()
            sueldos = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Sueldo')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    sueldo = Sueldo(row[0], row[1], row[2])
                    sueldos.append(sueldo.to_JSON())
                    
                connection.close()
                return sueldos
        except Exception as ex:
            raise Exception(ex)