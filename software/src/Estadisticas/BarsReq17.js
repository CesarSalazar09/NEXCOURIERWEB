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
      max: 1
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
        label: 'Horas Extra',
        data: [0.2, 0.3, 0.4, 0.5, 0.6, 0.7],
        backgroundColor: 'rgba(255, 99, 132, 0.5)'
      }
    ]
  };

  return <Bar data={chartData} options={options} />;
}
