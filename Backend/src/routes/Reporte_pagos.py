from flask import Blueprint, jsonify

#Models
from models.Reporte_pagosModel import Reporte_pagosModel

reporte_pagos = Blueprint('reporte_pagos', __name__)

@reporte_pagos.route('/')
def get_reporte_pagos():
    try:
        reporte_pagos = Reporte_pagosModel.get_reporte_pagos()
        return jsonify(reporte_pagos)
    except Exception as ex:
        return jsonify({'error': ex}), 500