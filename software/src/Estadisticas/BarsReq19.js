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
  const chartData = {
    labels: [
      'Brayan - A',
      'Natalia - B',
      'Cesar - C',
      'Sebastian - D',
    ],
    datasets: [
      {
        label: 'Horas Trabajadas',
        data: [7, 8.5, 9, 10],
        backgroundColor: 'rgba(0, 220, 195, 0.5)',
      },
    ],
  };

  return <Bar data={chartData} options={options} />;
}
