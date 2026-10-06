document.addEventListener('DOMContentLoaded', () => {
    const btnsViewVenda = document.querySelectorAll('.btn-view-venda');
    const modalViewVenda = document.getElementById('modal-view-venda');
    const closeViewVenda = document.getElementById('close-view-venda');
    const btnCloseViewVenda = document.getElementById('btn-close-view-venda');

    function toggleModal(show) {
        if (show) {
            modalViewVenda.classList.add('show');
        } else {
            modalViewVenda.classList.remove('show');
        }
    }

    btnsViewVenda.forEach(btn => btn.addEventListener('click', () => toggleModal(true)));
    if(closeViewVenda) closeViewVenda.addEventListener('click', () => toggleModal(false));
    if(btnCloseViewVenda) btnCloseViewVenda.addEventListener('click', () => toggleModal(false));

    window.addEventListener('click', (e) => {
        if (e.target === modalViewVenda) {
            toggleModal(false);
        }
    });
});

