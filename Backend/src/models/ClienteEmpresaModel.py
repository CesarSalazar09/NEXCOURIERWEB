from database.db import get_connection
from .entities.ClienteEmpresa import ClienteEmpresa

class ClienteEmpresaModel():

    @classmethod
    def get_ClienteEmpresas(self):
        try:
            connection = get_connection()
            ClienteEmpresas = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Cliente_empresa')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    clienteempresa = ClienteEmpresa(row[0], row[1], row[2], row[3], row[4])
                    ClienteEmpresas.append(clienteempresa.to_JSON())

                connection.close()
                return ClienteEmpresas
        except Exception as ex:
            raise Exception(ex)