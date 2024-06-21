import React from 'react';
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
  const chartData = {
    labels: ['A', 'B', 'C', 'D'],
    datasets: [
      {
        label: 'Horas trabajadas promedio',
        data: [7, 8.5, 9, 10],
        backgroundColor: 'rgba(0, 220, 195, 0.5)',
      },
    ],
  };

  return <Bar data={chartData} options={options} />;
}
