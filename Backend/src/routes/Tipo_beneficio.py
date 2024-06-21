from flask import Blueprint, jsonify

#Models
from models.Tipo_beneficioModel import Tipo_beneficioModel

tipo_beneficio = Blueprint('tipo_beneficio', __name__)

@tipo_beneficio.route('/')
def get_tipo_beneficio():
    try:
        tipo_beneficios = Tipo_beneficioModel.get_tipo_beneficio()
        return jsonify(tipo_beneficios)
    except Exception as ex:
        return jsonify({'error': ex}), 500