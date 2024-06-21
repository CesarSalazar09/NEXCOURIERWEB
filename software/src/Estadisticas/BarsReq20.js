import React, { useEffect, useState } from 'react';
import { Bar } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  BarElement,
  Title,
  Tooltip,
  Legend,
  Filler,
} from 'chart.js';
import axios from 'axios';

ChartJS.register(
  CategoryScale,
  LinearScale,
  PointElement,
  BarElement,
  Title,
  Tooltip,
  Legend,
  Filler
);

const options = {
  responsive: true,
  animation: false,
  plugins: {
    legend: {
      display: false,
    },
  },
  scales: {
    y: {
      min: 0,
      max: 10,
    },
    x: {
      ticks: {
        color: 'rgba(0, 220, 195)',
      },
    },
  },
};

export default function BarsReq20() {
  const [chartData, setChartData] = useState(null);

  useEffect(() => {
    axios
      .get('http://127.0.0.1:5000/api/asistencias/horas-promedio-trabajadas')
      .then(response => {
        const data = response.data;
        const labels = data.map(item => item.nombre_departamento);
        const horasPromedioTrabajadas = data.map(item => item.horas_promedio_trabajadas);

        const chartData = {
          labels: labels,
          datasets: [
            {
              label: 'Horas trabajadas promedio',
              data: horasPromedioTrabajadas,
              backgroundColor: 'rgba(0, 220, 195, 0.5)',
            },
          ],
        };

        setChartData(chartData);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return chartData ? <Bar data={chartData} options={options} /> : null;
}
