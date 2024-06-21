import { Bar } from 'react-chartjs-2';

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
      max: 200
    },
    x: {
      ticks: {
        color: 'rgb(255, 99, 132)'
      }
    }
  }
};

export default function BarsReq17() {
  const chartData = {
    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
    datasets: [
      {
        label: 'Deduccion Promedio',
        data: [200, 230, 140, 125, 130, 185],
        backgroundColor: 'rgba(255, 99, 132, 0.5)'
      }
    ]
  };

  return <Bar data={chartData} options={options} />;
}
