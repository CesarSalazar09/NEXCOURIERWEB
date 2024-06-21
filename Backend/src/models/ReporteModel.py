from database.db import get_connection
from .entities.Reporte import Reporte

class ReporteModel():

    @classmethod
    def get_reportes(self):
        try:
            connection = get_connection()
            reportes = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Reporte_asistencia')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    reporte = Reporte(row[0], row[1], row[2], row[3], row[4], row[5])
                    reportes.append(reporte.to_JSON())
                    
                connection.close()
                return reportes
        except Exception as ex:
            raise Exception(ex)