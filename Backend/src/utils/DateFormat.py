import datetime

class DateFormat():

    @classmethod
    def convert_date_type1(self, date):
        return date.strftime("%d/%m/%Y")

    @classmethod
    def convert_date_type2(self, date):
        return date.strftime("%d/%m/%Y %H:%M:%S")
