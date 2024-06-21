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
      max: 10
    },
    x: {
      ticks: {
        color: 'rgba(0, 220, 195)'
      }
    }
  }
};

export default function BarsReq16() {
  const [chartData, setChartData] = useState(null);

  useEffect(() => {
    axios.get('http://127.0.0.1:5000/api/asistencias/promedio-horas')
      .then(response => {
        const data = response.data;
        const meses = data.map(item => `Mes ${item.mes}`);
        const promedioHoras = data.map(item => item.promedio_horas);

        const chartData = {
          labels: meses,
          datasets: [
            {
              label: 'Promedio Horas',
              data: promedioHoras,
              backgroundColor: 'rgba(0, 220, 195, 0.5)'
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
