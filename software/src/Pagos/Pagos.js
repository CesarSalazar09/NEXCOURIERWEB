import React, { useState, useEffect } from 'react';
import DatePicker from 'react-datepicker';
import 'react-datepicker/dist/react-datepicker.css';
import '../Empleados/Empleados.css';
import Footers from '../componentes/footer/Footers';

const base_url = 'http://127.0.0.1:5000/';
let mostrarTablaPrincipal = true;

function Pagos() {
  const [data, setData] = useState([]);
  const [dni, setDni] = useState('');
  const [primerApellido, setPrimerApellido] = useState('');
  const [fechaContrato, setFechaContrato] = useState(null);
  const [empleados, setEmpleados] = useState([]);
  const [mostrarTabla, setMostrarTabla] = useState(false);
  const [montos, setMontos] = useState([]);

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

  useEffect(() => {
    const fetchNominaData = async () => {
      try {
        const response = await fetch(`${base_url}api/empleados/nomina`);
        const jsonData = await response.json();
        if (Array.isArray(jsonData)) {
          setMontos(jsonData);
        } else {
          console.error('La respuesta de la API no es un array', jsonData);
          setMontos([]); // O manejarlo de alguna otra manera
        }
      } catch (error) {
        console.log(error.message);
      }
    };
    fetchNominaData();
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
            <h1>PAGOS</h1>
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
                    <th>MONTO</th>
                  </tr>
                </thead>
                <tbody>
                  {data.slice(0, 4).map((empleado) => {
                    const asignacionFamiliar = empleado.asignacion_familiar ? 'Sí' : 'No';
                    const planilla = empleado.planilla ? 'Sí' : 'No';
                    const monto = montos.find((monto) => monto.dni === empleado.dni)?.monto || '';

                    return (
                      <tr key={empleado.dni}>
                        <td>{empleado.dni}</td>
                        <td>{`${empleado.primer_nombre} ${empleado.segundo_nombre}`}</td>
                        <td>{`${empleado.primer_apellido} ${empleado.segundo_apellido}`}</td>
                        <td>{empleado.correo_empresa}</td>
                        <td>{planilla}</td>
                        <td>{empleado.fecha_contrato}</td>
                        <td>{asignacionFamiliar}</td>
                        <td>{empleado.sueldo_base}</td>
                        <td>{(empleado.bono_desempeno + 
               empleado.pago_utilidades + 
               empleado.movilidad + 
               empleado.pago_suplencia + 
               empleado.pago_especiales + 
               empleado.cts + 
               empleado.afp + 
               empleado.sueldo_base)}</td>
                      </tr>
                    );
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
                    <th>MONTO</th>
                  </tr>
                </thead>
                <tbody>
                  {empleados.map((empleado) => {
                    const asignacionFamiliar = empleado.asignacion_familiar ? 'Sí' : 'No';
                    const planilla = empleado.planilla ? 'Sí' : 'No';
                    const monto = montos.find((monto) => monto.dni === empleado.dni)?.monto || '';

                    return (
                      <tr key={empleado.dni}>
                        <td>{empleado.dni}</td>
                        <td>{`${empleado.primer_nombre} ${empleado.segundo_nombre}`}</td>
                        <td>{`${empleado.primer_apellido} ${empleado.segundo_apellido}`}</td>
                        <td>{empleado.correo_empresa}</td>
                        <td>{planilla}</td>
                        <td>{empleado.fecha_contrato}</td>
                        <td>{asignacionFamiliar}</td>
                        <td>{empleado.sueldo_base}</td>
                        <td>{monto}</td>
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

export default Pagos;
