from flask import Blueprint, jsonify

#Models
from models.ClienteEmpresaModel import ClienteEmpresaModel

ClienteEmpresa = Blueprint('ClienteEmpresa', __name__)

@ClienteEmpresa.route('/')
def get_comunicados():
    try:
        ClienteEmpresas = ClienteEmpresaModel.get_ClienteEmpresas()
        return jsonify(ClienteEmpresas)
    except Exception as ex:
        return jsonify({'error': ex}), 500