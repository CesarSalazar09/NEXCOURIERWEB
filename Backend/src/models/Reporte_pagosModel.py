from database.db import get_connection
from .entities.Reporte_pagos import Reporte_pagos

class Reporte_pagosModel():
    @classmethod
    def get_reporte_pagos(self):
        try:
            connection = get_connection()
            reportes_pagos = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Reporte_pagos')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    reporte_pago = Reporte_pagos(row[0], row[1], row[2], row[3], row[4], row[5])
                    reportes_pagos.append(reporte_pago.to_JSON())
                    
                connection.close()
                return reportes_pagos
        except Exception as ex:
            raise Exception(ex)