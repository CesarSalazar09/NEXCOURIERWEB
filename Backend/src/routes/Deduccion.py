from flask import Blueprint, jsonify

#Models
from models.DeduccionModel import DeduccionModel

deduccion = Blueprint('deduccion', __name__)

@deduccion.route('/')
def get_deducciones():
    try:
        deducciones = DeduccionModel.get_deducciones()
        return jsonify(deducciones)
    except Exception as ex:
        return jsonify({'error': ex}), 500