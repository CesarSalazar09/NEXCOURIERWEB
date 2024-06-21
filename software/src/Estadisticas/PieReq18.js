import React, { useEffect, useState } from 'react';
import { Chart as ChartJS, PieController, ArcElement, Tooltip, Legend } from 'chart.js';
import { Pie } from 'react-chartjs-2';
import axios from 'axios';

ChartJS.register(PieController, ArcElement, Tooltip, Legend);

const options = {
  responsive: true,
  maintainAspectRatio: false,
};

export default function PieReq18() {
  const [chartData, setChartData] = useState(null);

  useEffect(() => {
    axios.get('http://127.0.0.1:5000/api/asistencias/porcentaje-asistencia')
      .then(response => {
        const data = response.data;
        const labels = data.map(item => `Mes ${item.mes}`);
        const porcentajesAsistencia = data.map(item => item.porcentaje_asistencia);

        const chartData = {
          labels: labels,
          datasets: [
            {
              label: 'Porcentaje de Inasistencia',
              data: porcentajesAsistencia,
              backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)',
              ],
              borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)',
              ],
              borderWidth: 1,
            },
          ],
        };

        setChartData(chartData);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return chartData ? <Pie data={chartData} options={options} /> : null;
}
