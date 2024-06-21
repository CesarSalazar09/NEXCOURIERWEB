from utils.DateFormat import DateFormat
class Sueldo():
    def __init__(self,cod_sueldo,fecha_pago, periodo_pago):
        self.cod_sueldo = cod_sueldo
        self.fecha_pago = fecha_pago
        self.periodo_pago = periodo_pago
      
        
    
    def to_JSON(self):
        return{
            'cod_sueldo': self.cod_sueldo,
            'fecha_pago': DateFormat.convert_date_type1(self.fecha_pago),
            'periodo_pago': self.periodo_pago
        }
    
    
        