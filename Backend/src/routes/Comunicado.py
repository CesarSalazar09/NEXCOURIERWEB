from flask import Blueprint, jsonify

#Models
from models.ComunicadoModel import ComunicadoModel

comunicado = Blueprint('comunicado', __name__)

@comunicado.route('/')
def get_comunicados():
    try:
        comunicados = ComunicadoModel.get_comunicados()
        return jsonify(comunicados)
    except Exception as ex:
        return jsonify({'error': ex}), 500