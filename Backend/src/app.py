from flask import Flask 
from flask_cors import CORS
from config import config

#Routes
from routes import Empleado, Departamento, Puesto, Reporte, Reporte_pagos, Sueldo, Tipo_beneficio, Tipo_deduccion, Tipo_usuario, Usuario
from routes import Plataforma
from routes import Login
from routes import Comunicado
from routes import ClienteEmpresa
from routes import Asistencia
from routes import Beneficio
from routes import Deduccion

app = Flask(__name__)
CORS(app)

def page_not_found(e):
    return '<h1>Not Found Page</h1>', 404
 
if __name__ == '__main__':
    app.config.from_object(config['development'])

    # Blueprint
    app.register_blueprint(Empleado.empleado, url_prefix='/api/empleados')
    app.register_blueprint(Departamento.departamento, url_prefix='/api/departamentos')
    app.register_blueprint(Puesto.puesto,url_prefix='/api/puestos')
    app.register_blueprint(Reporte.reporte,url_prefix='/api/reportes')
    app.register_blueprint(Reporte_pagos.reporte_pagos,url_prefix='/api/reportes_pago')
    app.register_blueprint(Sueldo.sueldo,url_prefix='/api/sueldos')
    app.register_blueprint(Tipo_beneficio.tipo_beneficio,url_prefix='/api/tipos_beneficio')
    app.register_blueprint(Tipo_deduccion.tipo_deduccion,url_prefix='/api/tipos_deduccion')
    app.register_blueprint(Tipo_usuario.tipo_usuario,url_prefix='/api/tipos_usuario')
    app.register_blueprint(Usuario.usuario,url_prefix='/api/usuarios')
    app.register_blueprint(Plataforma.plataforma, url_prefix='/api/plataformas')
    app.register_blueprint(Login.login, url_prefix='/api/login')
    app.register_blueprint(Comunicado.comunicado, url_prefix='/api/comunicado')
    app.register_blueprint(ClienteEmpresa.ClienteEmpresa, url_prefix='/api/ClienteEmpresa')
    app.register_blueprint(Asistencia.asistencia, url_prefix='/api/asistencias')
    app.register_blueprint(Beneficio.beneficio, url_prefix='/api/beneficios')
    app.register_blueprint(Deduccion.deduccion, url_prefix='/api/deducciones')

    # Error Handling
    app.register_error_handler(404, page_not_found)
    app.run()
 