from database.db import get_connection
from .entities.Departamento import Departamento

class DepartamentoModel():

    @classmethod
    def get_departamentos(self):
        try:
            connection = get_connection()
            departamentos = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Departamento')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    departamento = Departamento(row[0], row[1], row[2])
                    departamentos.append(departamento.to_JSON())

                connection.close()
                return departamentos
        except Exception as ex:
            raise Exception(ex)