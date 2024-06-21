from flask import Blueprint, jsonify

#Models
from models.DepartamentoModel import DepartamentoModel

departamento = Blueprint('departamento', __name__)

@departamento.route('/')
def get_departamentos():
    try:
        departamentos = DepartamentoModel.get_departamentos()
        return jsonify(departamentos)
    except Exception as ex:
        return jsonify({'error': ex}), 500