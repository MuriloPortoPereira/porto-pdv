document.addEventListener('DOMContentLoaded', () => {
    const btnNovoProduto = document.getElementById('btn-novo-produto');
    const modalProduto = document.getElementById('modal-produto');
    const closeModalProduto = document.getElementById('close-modal-produto');
    const btnCancelarProduto = document.getElementById('btn-cancelar-produto');

    function toggleModal(show) {
        if (show) {
            modalProduto.classList.add('show');
        } else {
            modalProduto.classList.remove('show');
        }
    }

    if(btnNovoProduto) btnNovoProduto.addEventListener('click', () => toggleModal(true));
    if(closeModalProduto) closeModalProduto.addEventListener('click', () => toggleModal(false));
    if(btnCancelarProduto) btnCancelarProduto.addEventListener('click', () => toggleModal(false));
    
    // Fechar ao clicar fora
    if(modalProduto) {
        modalProduto.addEventListener('click', (e) => {
            if(e.target === modalProduto) {
                toggleModal(false);
            }
        });
    }
});

