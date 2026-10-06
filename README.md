# Sistema de Vendas - Porto Works

Um Sistema de Vendas (PDV) completo projetado para lojas especializadas em tecnologia, games, informática e colecionáveis.

##  Objetivo
Fornecer uma interface administrativa unificada e intuitiva para o gerenciamento total de um estabelecimento comercial, desde o cadastro do catálogo até a conversão em vendas, acompanhamento financeiro e controle rigoroso de estoque.

##  Escopo Atual
- Gestão de Catálogo (Marcas, Categorias, Subcategorias e Produtos).
- Controle de Estoque (entradas, saídas, alertas de baixo nível).
- Frente de Caixa (nova venda, associação de vendedor/cliente, pagamentos).
- Histórico de Vendas (listagem, status de pagamento, detalhes do pedido).
- Dashboard e Relatórios (lucro bruto real ancorado em custo histórico).
- Gerenciamento de Perfil e Configurações Globais do Sistema.

##  Tecnologias Utilizadas
- **Front-end:** HTML, CSS, JavaScript (Vanilla), mantendo a performance leve e estrutura customizada sem dependência de frameworks.
- **Banco de Dados:** SQLite (com modelagem relacional V2 normalizada).
- **Back-end:** (A ser implementado em Python/FastAPI futuramente).

##  Estrutura do Projeto
- `frontend/` - Código-fonte da interface visual (Páginas, CSS, JS estáticos).
- `database/` - Arquivos SQL (`schema.sql` e `seed.sql`) e banco local.
- `docs/` - Documentação oficial do projeto (Wireframes, Banco de Dados, Escopo).
- `backend/` - Estrutura base reservada para a lógica do servidor.

##  Organização de Branches (Git)
O repositório segue o fluxo estruturado:
- `main` - Versão principal e estável do projeto.
- `develop` - Ramo de integração contínua (features em teste).
- `feature/*` - Ramos temporários para desenvolvimento de funcionalidades específicas.

##  Estrutura Atual do Banco de Dados
O sistema está na **Modelagem Relacional V2**, que engloba 11 tabelas normalizadas. As principais novidades da V2 incluem um sistema de `usuarios`, tabela central de `configuracoes_sistema`, ligação forte do vendedor (`usuario_id`) na Venda e trava do custo histórico (`custo_unitario`) nos Itens da Venda. 
> *Para mais informações e diagrama, consulte `docs/database/banco-de-dados.md`*.

##  Como Executar o Projeto (Visualização Front-end)
1. Certifique-se de não estar utilizando protocolos `file://` locais que bloqueiam importação de módulos ES6 (se aplicável), mas para os arquivos atuais basta abrir o arquivo no navegador.
2. Inicie abrindo `frontend/index.html` em seu navegador padrão.
3. Você será redirecionado para a tela de Login (mock visual), de onde poderá acessar as demais telas da aplicação.

##  Documentação
Toda a documentação pode ser encontrada na pasta `/docs`:
- **[Wireframes Base](docs/wireframes/)**: Referências visuais iniciais.
- **[Escopo do Projeto](docs/scope/escopo.md)**: Detalhamento do negócio.
- **[Banco de Dados](docs/database/banco-de-dados.md)**: Diagrama ER e estruturas.
