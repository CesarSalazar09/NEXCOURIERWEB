import React from "react";
import Footers from "../componentes/footer/Footers";

function Variables() {
  const handleGuardarClick = () => {
    // Obtener los valores de los campos de entrada
    const afpValue = document.getElementById("afp").value;
    const onpValue = document.getElementById("onp").value;
    const otroSeguroValue = document.getElementById("otro-seguro").value;
    const plantillaValue = document.getElementById("plantilla").value;
    const asignacionFamiliarValue = document.getElementById("asignacion-familiar").value;

    // Hacer algo con los valores ingresados, como guardarlos en una base de datos

    // Limpiar los campos de entrada
    document.getElementById("afp").value = "";
    document.getElementById("onp").value = "";
    document.getElementById("otro-seguro").value = "";
    document.getElementById("plantilla").value = "";
    document.getElementById("asignacion-familiar").value = "";
  };

  return (
    <>
    <div>
      <h1>Mi Formulario</h1>
      <label htmlFor="afp">Porcentaje Seguro AFP:</label>
      <input type="text" id="afp" />

      <label htmlFor="onp">Porcentaje Seguro ONP:</label>
      <input type="text" id="onp" />

      <label htmlFor="otro-seguro">Porcentaje Otro Seguro:</label>
      <input type="text" id="otro-seguro" />

      <label htmlFor="plantilla">Monto Plantilla:</label>
      <input type="text" id="plantilla" />

      <label htmlFor="asignacion-familiar">Monto Asignación Familiar:</label>
      <input type="text" id="asignacion-familiar" />

      <button onClick={handleGuardarClick}>Guardar datos</button>
    </div>
    <Footers/>
    </>
  );
}

export default Variables;
