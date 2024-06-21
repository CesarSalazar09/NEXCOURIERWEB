from flask import Blueprint, jsonify

#Models
from models.PuestoModel import PuestoModel

puesto = Blueprint('puesto', __name__)

@puesto.route('/')
def get_puestos():
    try:
        puestos = PuestoModel.get_puestos()
        return jsonify(puestos)
    except Exception as ex:
        return jsonify({'error': ex}), 500