import { useEffect, useState } from 'react';
import { Bar } from 'react-chartjs-2';
import axios from 'axios';

const options = {
  responsive: true,
  animation: false,
  plugins: {
    legend: {
      display: false
    }
  },
  scales: {
    y: {
      min: 0,
      max: 1
    },
    x: {
      ticks: {
        color: 'rgb(255, 99, 132)'
      }
    }
  }
};

export default function BarsReq16() {
  const [chartData, setChartData] = useState(null);

  useEffect(() => {
    axios.get('http://127.0.0.1:5000/api/asistencias/horas-extra')
      .then(response => {
        const data = response.data;
        const meses = data.map(item => `Mes ${item.mes}`);
        const horasExtra = data.map(item => item.horas_extra);

        const chartData = {
          labels: meses,
          datasets: [
            {
              label: 'Horas Extra',
              data: horasExtra,
              backgroundColor: 'rgb(255, 99, 132, 0.5)'
            }
          ]
        };

        setChartData(chartData);
      })
      .catch(error => {
        console.error('Error fetching data:', error);
      });
  }, []);

  return chartData ? <Bar data={chartData} options={options} /> : null;
}
