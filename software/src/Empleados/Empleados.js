import React, { useState, useEffect } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import '../Empleados/Empleados.css';
import Footers from '../componentes/footer/Footers';

const base_url = 'http://127.0.0.1:5000/';
let mostrarTablaPrincipal = true;

function Empleados() {
  const [data, setData] = useState([]);
  const [dni, setDni] = useState('');
  const [primerApellido, setPrimerApellido] = useState('');
  const [fechaContrato, setFechaContrato] = useState(null);
  const [empleados, setEmpleados] = useState([]);
  const [mostrarTabla, setMostrarTabla] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(`${base_url}api/empleados/`);
        const jsonData = await response.json();
        setData(jsonData);
      } catch (error) {
        console.log(error.message);
      }
    };
    fetchData();
  }, []);

  const handleFechaContratoChange = (date) => {
    setFechaContrato(date);
  };

  const handleDniChange = (event) => {
    setDni(event.target.value);
  };

  const handlePrimerApellidoChange = (event) => {
    setPrimerApellido(event.target.value);
  };

  const handleBuscar = async (event) => {
    event.preventDefault();
    mostrarTablaPrincipal = false;

    try {
      let url = `${base_url}api/empleados/?dni=${dni}&primer_apellido=${primerApellido}`;

      if (fechaContrato) {
        const formattedDate = fechaContrato.toLocaleDateString('es-ES');
        url += `&fecha_contrato=${formattedDate}`;
      }

      const response = await fetch(url);
      const jsonData = await response.json();
      setEmpleados(jsonData);
      setMostrarTabla(true);
    } catch (error) {
      console.log(error.message);
    }
  };

  return (
    <>
      <div>
        <section id='inicio' className='inicio'>
          <div className='titulo'>
            <h1>EMPLEADOS</h1>
          </div>

          <form className='formulario' onSubmit={handleBuscar}>
            <div className='fila'>
              <div className='campo'>
                <label>DNI:</label>
                <input type='text' placeholder='Ingrese DNI' maxLength={8} value={dni} onChange={handleDniChange} />
              </div>
              <div className='campo-apellido'>
                <label>Primer Apellido:</label>
                <input type='text' placeholder='Ingrese su primer apellido' maxLength={15} value={primerApellido} onChange={handlePrimerApellidoChange}></input>
              </div>
              <div className='campo'>
                <label>Fecha Contrato:</label>
                <DatePicker
                  selected={fechaContrato}
                  onChange={handleFechaContratoChange}
                  placeholderText='Mes/Día/Año 📆'
                />
              </div>
              <button className='boton' type='submit'>
                Buscar
              </button>
            </div>
          </form>

          <div className='registrar-empleado'>
            <button className='boton-registro' onClick={() => window.location.reload()}>
              Agregar Empleado
            </button>
          </div>

          <div className='tabla-container'>
            {mostrarTablaPrincipal && (
              <table className='tabla-empleados'>
                <thead>
                  <tr>
                    <th>DNI</th>
                    <th>NOMBRES</th>
                    <th>APELLIDOS</th>
                    <th>CORREO EMPRESA</th>
                    <th>PLANILLA</th>
                    <th>CONTRATO</th>
                    <th>ASIGNACION FAMILIAR</th>
                    <th>SUELDO</th>
                  </tr>
                </thead>
                <tbody>
                  {data.map((empleado, index) => {
                    if (index < 4) {
                      // Limitar a 4 filas
                      if (empleado.asignacion_familiar === false) {
                        empleado.asignacion_familiar = 'No';
                      } else {
                        empleado.asignacion_familiar = 'Sí';
                      }
                      if (empleado.planilla === false) {
                        empleado.planilla = 'No';
                      } else {
                        empleado.planilla = 'Sí';
                      }
                      return (
                        <tr key={empleado.dni}>
                          <td>{empleado.dni}</td>
                          <td>{empleado.primer_nombre + ' ' + empleado.segundo_nombre}</td>
                          <td>{empleado.primer_apellido + ' ' + empleado.segundo_apellido}</td>
                          <td>{empleado.correo_empresa}</td>
                          <td>{empleado.planilla}</td>
                          <td>{empleado.fecha_contrato}</td>
                          <td>{empleado.asignacion_familiar}</td>
                          <td>{empleado.sueldo_base}</td>
                        </tr>
                      );
                    }
                    return null;
                  })}
                </tbody>
              </table>
            )}
          </div>

          <div className='tabla-container'>
            {mostrarTabla && (
              <table className='tabla-empleados'>
                <thead>
                  <tr>
                    <th>DNI</th>
                    <th>NOMBRES</th>
                    <th>APELLIDOS</th>
                    <th>CORREO EMPRESA</th>
                    <th>PLANILLA</th>
                    <th>CONTRATO</th>
                    <th>ASIGNACION FAMILIAR</th>
                    <th>SUELDO</th>
                  </tr>
                </thead>
                <tbody>
                  {empleados.map((empleado) => {
                    if (empleado.asignacion_familiar === false) {
                      empleado.asignacion_familiar = 'No';
                    } else {
                      empleado.asignacion_familiar = 'Sí';
                    }
                    if (empleado.planilla === false) {
                      empleado.planilla = 'No';
                    } else {
                      empleado.planilla = 'Sí';
                    }
                    return (
                      <tr key={empleado.dni}>
                        <td>{empleado.dni}</td>
                        <td>{empleado.primer_nombre + ' ' + empleado.segundo_nombre}</td>
                        <td>{empleado.primer_apellido + ' ' + empleado.segundo_apellido}</td>
                        <td>{empleado.correo_empresa}</td>
                        <td>{empleado.planilla}</td>
                        <td>{empleado.fecha_contrato}</td>
                        <td>{empleado.asignacion_familiar}</td>
                        <td>{empleado.sueldo_base}</td>
                      </tr>
                    );
                  })}
                </tbody>
              </table>
            )}
          </div>
        </section>
      </div>
      <Footers />
    </>
  );
}

export default Empleados;
