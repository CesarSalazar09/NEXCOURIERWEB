from database.db import get_connection
from .entities.Login import Login

class LoginModel():

    @classmethod
    def get_logins(self):
        try:
            connection = get_connection()
            logins = []

            with connection.cursor() as cursor:
                cursor.execute('SELECT * FROM Login')
                records = cursor.fetchall()
                #print(records)
                for row in records:
                    login = Login(row[0], row[1], row[2], row[3], row[4])
                    logins.append(login.to_JSON())

                connection.close()
                return logins
        except Exception as ex:
            raise Exception(ex)