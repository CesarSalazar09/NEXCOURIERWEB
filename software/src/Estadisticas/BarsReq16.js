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
      max: 120
    },
    x: {
      ticks: {
        color: 'rgba(0, 220, 195)'
      }
    }
  }
};

export default function BarsReq16() {
  const chartData = {
    labels: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio'],
    datasets: [
      {
        label: 'Promedio Horas',
        data: [70, 80, 70, 90, 100, 110],
        backgroundColor: 'rgba(0, 220, 195, 0.5)'
      }
    ]
  };

  return <Bar data={chartData} options={options} />;
}
