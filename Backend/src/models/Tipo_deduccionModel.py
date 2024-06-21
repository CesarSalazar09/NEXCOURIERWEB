from database.db import get_connection
from .entities.Tipo_deduccion import Tipo_deduccion

class Tipo_deduccionModel():
    @classmethod
    def get_tipo_deduccion(self):
        try:
            connection = get_connection()
            tipos_deducciones = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Tipo_deduccion')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    tipo_deduccion = Tipo_deduccion(row[0], row[1], row[2], row[3])
                    tipos_deducciones.append(tipo_deduccion.to_JSON())
                    
                connection.close()
                return tipos_deducciones
        except Exception as ex:
            raise Exception(ex) 