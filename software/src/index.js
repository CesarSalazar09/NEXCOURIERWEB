import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import { BrowserRouter } from 'react-router-dom';
import Headers from './componentes/header/Headers'
import Empleados from './Empleados/Empleados';
import Variables from './Pagos/Variables';
ReactDOM.render(
  <BrowserRouter>
    <Headers/>
  </BrowserRouter>,
  document.getElementById('root')
);
// const root = ReactDOM.createRoot(document.getElementById('root'));
// root.render(
//   <React.StrictMode>
//     <Pagos/>
//   </React.StrictMode>
// );

