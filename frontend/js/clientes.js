document.addEventListener('DOMContentLoaded', () => {
    // Modal Novo Cliente
    const btnNovoCliente = document.getElementById('btn-novo-cliente');
    const modalCliente = document.getElementById('modal-cliente');
    const closeBtnsCliente = document.querySelectorAll('.close-modal-cliente');

    function toggleModalCliente(show) {
        if (show) {
            modalCliente.classList.add('show');
        } else {
            modalCliente.classList.remove('show');
        }
    }

    if(btnNovoCliente) btnNovoCliente.addEventListener('click', () => toggleModalCliente(true));
    closeBtnsCliente.forEach(btn => btn.addEventListener('click', () => toggleModalCliente(false)));

    // Modal Visualizar Cliente
    const btnsViewCliente = document.querySelectorAll('.btn-view-cliente');
    const modalViewCliente = document.getElementById('modal-view-cliente');
    const closeViewCliente = document.getElementById('close-view-cliente');
    const btnCloseViewCliente = document.getElementById('btn-close-view-cliente');

    function toggleModalView(show) {
        if (show) {
            modalViewCliente.classList.add('show');
        } else {
            modalViewCliente.classList.remove('show');
        }
    }

    btnsViewCliente.forEach(btn => btn.addEventListener('click', () => toggleModalView(true)));
    if(closeViewCliente) closeViewCliente.addEventListener('click', () => toggleModalView(false));
    if(btnCloseViewCliente) btnCloseViewCliente.addEventListener('click', () => toggleModalView(false));

    // Fechar ao clicar fora
    window.addEventListener('click', (e) => {
        if(e.target === modalCliente) toggleModalCliente(false);
        if(e.target === modalViewCliente) toggleModalView(false);
    });
});

