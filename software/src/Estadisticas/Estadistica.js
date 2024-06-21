/*
    Estos 'imports' sirven para incluir bootstrap, NO son necesarios para
    utilizar las gráficas de ChartJS. Yo los utilizaré para modificar 
    rápidamente el aspecto de mi página durante los ejemplos expuestos. 
*/
import React from 'react';
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle";
import './Estadistica.css';
import Footers from '../componentes/footer/Footers';
import BarsReq16 from './BarsReq16';
import BarsReq17 from './BarsReq17';
import PieReq18 from './PieReq18';
import BarsReq19 from './BarsReq19';
import BarsReq20 from './BarsReq20';

function Estadistica() {
    return (
        <>
        <div>
            <section id="inicio" class="inicio">
                <div class="titulo">
                    <h1>ESTADISTICAS</h1>
                </div>
                <div class="graficos">
                    <div class="grafico">
                        <p className="m-2"><b>Promedio de Horas Trabajadas Por Mes </b></p>
                        <div className="bg-light mx-auto px-2 border border-2 border-primary" style={{width:"300px", height:"150px"}}>
                            <BarsReq16 />
                        </div>
                    </div>
                    <div class="grafico">
                        <p className="m-2"><b>Promedio de Deducciones Por Mes </b></p>
                        <div className="bg-light mx-auto px-2 border border-2 border-primary" style={{width:"300px", height:"150px"}}>
                            <BarsReq17 />
                        </div>
                    </div>
                    <div class="grafico">
                        <p className="m-2"><b>Porcentaje de bonificaciones Por Mes</b></p>
                        <div className="bg-light mx-auto border border-2 border-primary" style={{width:"300px", height:"150px"}}>
                            <div style={{width:"100%", height:"100%", padding:"10px 0"}}>
                                <PieReq18 />                       
                            </div>
                        </div>
                    </div>
                    <div class="grafico">
                        <p className="m-2"><b>Trabajadores con Mayor Deducción Por Departamento (Último mes)</b></p>
                        <div className="bg-light mx-auto px-2 border border-2 border-primary" style={{width:"300px", height:"150px"}}>
                            <BarsReq19 />
                        </div>
                    </div>
                    <div class="grafico">
                        <p className="m-2"><b>Monto promedio en el ultimo año Por Departamento</b></p>
                        <div className="bg-light mx-auto px-2 border border-2 border-primary" style={{width:"300px", height:"150px"}}>
                            <BarsReq20 />
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <Footers/>
    </>
  );
}

export default Estadistica;