from flask import Blueprint, jsonify

#Models
from models.BeneficioModel import BeneficioModel

beneficio = Blueprint('beneficio', __name__)

@beneficio.route('/')
def get_beneficios():
    try:
        beneficios = BeneficioModel.get_beneficios()
        return jsonify(beneficios)
    except Exception as ex:
        return jsonify({'error': ex}), 500