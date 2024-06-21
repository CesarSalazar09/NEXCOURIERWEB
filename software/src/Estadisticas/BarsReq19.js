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
    tooltip: {
      callbacks: {
        label: (context) => {
          const label = context.dataset.label || '';
          const data = context.parsed.y;
          const departamento = context.chart.data.labels[context.dataIndex].split(' - ')[1];
          return `${label}: ${data} horas (${departamento})`;
        },
      },
    },
  },
  scales: {
    y: {
      min: 0,
      max: 10,
    },
    x: {
      ticks: { color: 'rgba(0, 220, 195)' },
    },
  },
};

export default function BarsReq19() {
  const [chartData, setChartData] = useState(null);

  useEffect(() => {
    axios
      .get('http://127.0.0.1:5000/api/asistencias/horas-trabajadas-departamento')
      .then(response => {
        const data = response.data;
        const labels = data.map(item => `${item.empleado} - ${item.departamento}`);
        const horasTrabajadas = data.map(item => item.horas_trabajadas);

        const chartData = {
          labels: labels,
          datasets: [
            {
              label: 'Horas Trabajadas',
              data: horasTrabajadas,
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


