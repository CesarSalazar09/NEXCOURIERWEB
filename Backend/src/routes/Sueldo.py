from flask import Blueprint, jsonify

#Models
from models.SueldoModel import SueldoModel

sueldo = Blueprint('sueldo', __name__)

@sueldo.route('/')
def get_sueldo():
    try:
        sueldos = SueldoModel.get_sueldos()
        return jsonify(sueldos)
    except Exception as ex:
        return jsonify({'error': ex}), 500