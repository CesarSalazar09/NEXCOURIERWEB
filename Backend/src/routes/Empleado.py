from flask import Blueprint, jsonify, request

#Models
from models.EmpleadoModel import EmpleadoModel

empleado = Blueprint('empleado', __name__)

@empleado.route('/', methods=['GET'])
def get_empleados():
    try:
        dni = request.args.get('dni')  
        fecha_contrato = request.args.get('fecha_contrato')  
        primer_apellido = request.args.get('primer_apellido')  

        if dni is None and fecha_contrato is None and primer_apellido is None:
            empleados = EmpleadoModel.get_empleados()
        else:
            empleados = EmpleadoModel.get_empleados(dni=dni, fecha_contrato=fecha_contrato, primer_apellido=primer_apellido)

        return jsonify(empleados)
    except Exception as ex:
        return jsonify({'error': str(ex)}), 500
    
@empleado.route('/add', methods=['POST'])
def add_empleado():
    try:
        empleado = request.get_json()
        affected_rows = EmpleadoModel.add_empleado(empleado)
        return jsonify({'affected_rows': affected_rows})
    except Exception as ex:
        return jsonify({'error': str(ex)}), 500
    
@empleado.route('/nomina', methods=['GET'])
def get_nomina():
    try:
        nominas = EmpleadoModel.get_nomina()
        return jsonify(nominas)
    except Exception as ex:
        return jsonify({'error': str(ex)}), 500
    