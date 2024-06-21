from flask import Blueprint, jsonify

#Models
from models.Tipo_usuarioModel import Tipo_usuarioModel

tipo_usuario = Blueprint('tipo_usuario', __name__)

@tipo_usuario.route('/')
def get_tipo_usuario():
    try:
        tipo_usuarios = Tipo_usuarioModel.get_tipo_usuario()
        return jsonify(tipo_usuarios)
    except Exception as ex:
        return jsonify({'error': ex}), 500