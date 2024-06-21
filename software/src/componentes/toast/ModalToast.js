// ModalToast.js
import React, { useEffect } from 'react';
import './ModalToast.css';

export default function ModalToast({ message, onClose }) {
  useEffect(() => {
    const timer = setTimeout(() => {
      onClose();
    }, 3000); // El mensaje desaparece después de 3 segundos
    return () => clearTimeout(timer);
  }, [onClose]);

  return (
    <div className="modal-toast-overlay">
      <div className="modal-toast">
        {message}
      </div>
    </div>
  );
}
