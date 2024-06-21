from database.db import get_connection
from .entities.Tipo_beneficio import Tipo_beneficio

class Tipo_beneficioModel():
    @classmethod
    def get_tipo_beneficio(self):
        try:
            connection = get_connection()
            tipos_beneficios = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Tipo_beneficio')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    tipo_beneficio = Tipo_beneficio(row[0], row[1], row[2], row[3])
                    tipos_beneficios.append(tipo_beneficio.to_JSON())
                    
                connection.close()
                return tipos_beneficios
        except Exception as ex:
            raise Exception(ex) 