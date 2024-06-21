import React, { useState } from 'react';
import './VariablesParaPagos.css';
import 'react-datepicker/dist/react-datepicker.css';
import '../Empleados/Empleados.css';
import Footers from '../componentes/footer/Footers';
import ModalToast from '../componentes/toast/ModalToast'; // Ajusta la ruta según tu estructura de proyecto

const base_url = 'http://127.0.0.1:5000/';
let mostrarTablaPrincipal = true;

function VariablesParaPagos() {
  const [afp, setAfp] = useState('');
  const [onp, setOnp] = useState('');
  const [otroSeguro, setOtroSeguro] = useState('');
  const [montoPlanilla, setMontoPlanilla] = useState('');
  const [montoAsignacionFamiliar, setMontoAsignacionFamiliar] = useState('');
  const [showToast, setShowToast] = useState(false);

  const handleGuardarDatos = (e) => {
    e.preventDefault();
    // Aquí puedes manejar el envío de datos al backend o la lógica de guardado
    console.log({
      afp,
      onp,
      otroSeguro,
      montoPlanilla,
      montoAsignacionFamiliar,
    });
    setShowToast(true);
  };

  const handleCancelar = () => {
    // Resetea los valores del formulario
    setAfp('');
    setOnp('');
    setOtroSeguro('');
    setMontoPlanilla('');
    setMontoAsignacionFamiliar('');
  };

  return (
    <div className="inicio">
      <div className='titulo'>
        <h1>VARIABLES PARA PAGOS</h1>
      </div>
      <div className="form-container">
        {showToast && <ModalToast message="Datos guardados correctamente" onClose={() => setShowToast(false)} />}
        <form onSubmit={handleGuardarDatos}>
          <div className="form-group">
            <label>Porcentaje de seguro AFP</label>
            <input
              type="text"
              value={afp}
              onChange={(e) => setAfp(e.target.value)}
            />
          </div>
          <div className="form-group">
            <label>Porcentaje seguro ONP</label>
            <input
              type="text"
              value={onp}
              onChange={(e) => setOnp(e.target.value)}
            />
          </div>
          <div className="form-group">
            <label>Porcentaje otro seguro</label>
            <input
              type="text"
              value={otroSeguro}
              onChange={(e) => setOtroSeguro(e.target.value)}
            />
          </div>
          <div className="form-group">
            <label>Monto planilla</label>
            <input
              type="text"
              value={montoPlanilla}
              onChange={(e) => setMontoPlanilla(e.target.value)}
            />
          </div>
          <div className="form-group">
            <label>Monto asignación familiar</label>
            <input
              type="text"
              value={montoAsignacionFamiliar}
              onChange={(e) => setMontoAsignacionFamiliar(e.target.value)}
            />
          </div>
          <div className="form-buttons">
            <button type="submit" className="save-button">Guardar Datos</button>
            <button type="button" className="cancel-button" onClick={handleCancelar}>Cancelar</button>
          </div>
        </form>
      </div>
      <Footers />
    </div>
  );
}

export default VariablesParaPagos;
