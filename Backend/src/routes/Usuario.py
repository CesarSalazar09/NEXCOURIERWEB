from flask import Blueprint, jsonify

#Models
from models.UsuarioModel import UsuarioModel

usuario = Blueprint('usuario', __name__)

@usuario.route('/')
def get_usuario():
    try:
        usuarios = UsuarioModel.get_usuario()
        return jsonify(usuarios)
    except Exception as ex:
        return jsonify({'error': ex}), 500