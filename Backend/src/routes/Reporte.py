from flask import Blueprint, jsonify

#Models
from models.ReporteModel import ReporteModel

reporte = Blueprint('reporte', __name__)

@reporte.route('/')
def get_reportes():
    try:
        reportes = ReporteModel.get_reportes()
        return jsonify(reportes)
    except Exception as ex:
        return jsonify({'error': ex}), 500