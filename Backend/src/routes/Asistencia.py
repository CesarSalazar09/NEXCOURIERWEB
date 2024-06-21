from flask import Blueprint, jsonify

#Models
from models.AsistenciaModel import AsistenciaModel

asistencia = Blueprint('asistencia', __name__)

@asistencia.route('/')
def get_asistencias():
    try:
        asistencias = AsistenciaModel.get_asistencias()
        return jsonify(asistencias)
    except Exception as ex:
        return jsonify({'error': ex}), 500

#Requerimiento 16
@asistencia.route('/promedio-horas')
def get_promedio_horas():
    try:
        promedio_horas = AsistenciaModel.get_promedio_horas()
        return jsonify(promedio_horas)
    except Exception as ex:
        return jsonify({'error': ex}), 500

#Requerimiento 17
@asistencia.route('/horas-extra')
def get_horas_extra():
    try:
        horas_extra = AsistenciaModel.get_horas_extra()
        return jsonify(horas_extra)
    except Exception as ex:
        return jsonify({'error': ex}), 500

#Requerimiento 18
@asistencia.route('/porcentaje-asistencia')
def get_porcentaje_asistencia():
    try:
        porcentaje_asistencia = AsistenciaModel.get_porcentaje_asistencia()
        return jsonify(porcentaje_asistencia)
    except Exception as ex:
        return jsonify({'error': ex}), 500

#Requerimiento 19
@asistencia.route('/horas-trabajadas-departamento')
def get_horas_trabajadas_departamento():
    try:
        horas_trabajadas_departamento = AsistenciaModel.get_horas_trabajadas_departamento()
        return jsonify(horas_trabajadas_departamento)
    except Exception as ex:
        return jsonify({'error': ex}), 500

#Requerimiento 20   
@asistencia.route('/horas-promedio-trabajadas')
def get_horas_promedio_trabajadas():
    try:
        horas_promedio_trabajadas = AsistenciaModel.get_horas_promedio_trabajadas()
        return jsonify(horas_promedio_trabajadas)
    except Exception as ex:
        return jsonify({'error': ex}), 500
