import '../header/Headers.css'
import {Link, Routes, Route} from 'react-router-dom';
import Estadistica from '../../Estadisticas/Estadistica';
import Pagos from '../../Pagos/Pagos';
import Empleados from '../../Empleados/Empleados';
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
                        <li><Link to='/'>REPORTES ASISTENCIAS</Link></li>
                        <li><Link to='/' >ASISTENCIA</Link></li>
                        <li><Link to='/pagos'>PAGOS</Link></li>
                        <li><Link to='/estadisticas'>ESTADISTICAS</Link></li>
                    </ul>
                    <div class="sesion">
                        <a href="#">Administrador</a>
                        <a href="#">Lobo@uni.pe</a>
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
                <Route path='/estadisticas' element={<Estadistica />}/>
            </Routes>
        </div>
    )
}
export default Headers;