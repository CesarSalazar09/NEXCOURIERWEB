from flask import Blueprint, jsonify

#Models
from models.LoginModel import LoginModel

login = Blueprint('login', __name__)

@login.route('/')
def get_logins():
    try:
        logins = LoginModel.get_logins()
        return jsonify(logins)
    except Exception as ex:
        return jsonify({'error': ex}), 500