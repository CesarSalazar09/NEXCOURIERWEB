import '../header/Headers.css'
import {Link, Routes, Route} from 'react-router-dom';
import Estadistica from '../../Estadisticas/Estadistica';
import Pagos from '../../Pagos/Pagos';
import Empleados from '../../Empleados/Empleados';
import VariablesParaPagos from '../../Nomina/Variables';
import Nomina from '../../Nomina/Nomina';

const  Headers= () =>{
    return(
        <div class="contenedor-header">
            <header>
                <div class="logo">
                    <a href="#">NexCourier</a>
                </div>
                <nav id="nav">
                    <ul>
                        <li><Link to='/'>INICIO</Link></li>
                        <li><Link to='/empleados'>EMPLEADOS</Link></li>
                        <li><Link to='/pagos'>PAGOS</Link></li>
                        <li><Link to='/nomina'>NÓMINA</Link></li>
                        <li><Link to='/estadisticas'>ESTADISTICAS</Link></li>
                        <li><Link to='/variables'>VARIABLES</Link></li>
                    </ul>
                    <div class="sesion">
                        <a href="#">Administrador</a>
                        <a href="#">Pepe@uni.pe</a>
                    </div>
                </nav>
                <div class="nav-responsive" onclick="mostrarOcultarMenu()">
                    <i class="fa-solid fa-bars-staggered"></i>
                </div>
            </header>
            <Routes>
                <Route path='/' element={<Pagos />}/>
                <Route path='/empleados' element={<Empleados />}/>
                <Route path='/pagos' element={<Pagos />}/>
                <Route path='/nomina' element={<Nomina />}/>
                <Route path='/estadisticas' element={<Estadistica />}/>
                <Route path='/variables' element={<VariablesParaPagos />}/>
            </Routes>
        </div>
    )
}
export default Headers;