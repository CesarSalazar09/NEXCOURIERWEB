from flask import Blueprint, jsonify

#Models
from models.PlataformaModel import PlataformaModel

plataforma = Blueprint('plataforma', __name__)

@plataforma.route('/')
def get_plataformas():
    try:
        plataformas = PlataformaModel.get_plataformas()
        return jsonify(plataformas)
    except Exception as ex:
        return jsonify({'error': ex}), 500