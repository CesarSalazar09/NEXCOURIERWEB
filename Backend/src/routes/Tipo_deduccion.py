from flask import Blueprint, jsonify

#Models
from models.Tipo_deduccionModel import Tipo_deduccionModel

tipo_deduccion = Blueprint('tipo_deduccion', __name__)

@tipo_deduccion.route('/')
def get_tipo_deduccion():
    try:
        tipo_deducciones = Tipo_deduccionModel.get_tipo_deduccion()
        return jsonify(tipo_deducciones)
    except Exception as ex:
        return jsonify({'error': ex}), 500