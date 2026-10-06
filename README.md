# Porto PDV - Sistema Administrativo de Vendas

O **Porto PDV** é um sistema de Ponto de Venda (PDV) e gestão administrativa (ERP leve) desenvolvido com foco em lojas especializadas em tecnologia, informática e colecionáveis. Este repositório reflete minha evolução no desenvolvimento de software, consolidando conceitos práticos de modelagem de banco de dados, construção de interface e, futuramente, desenvolvimento de APIs.

## Objetivo do Projeto
O objetivo principal é construir uma plataforma unificada e intuitiva que permita o controle completo de um estabelecimento comercial, eliminando a dependência de planilhas isoladas e centralizando a operação de caixa, o monitoramento do estoque e o relacionamento com clientes.

## O Problema que o Sistema Resolve
Pequenos varejistas frequentemente enfrentam dificuldades ao escalar suas operações devido à perda do histórico financeiro (por exemplo, flutuação de custos de produtos mascarando lucros reais) e à falta de integração entre a venda e o controle de estoque. O Porto PDV resolve isso travando o custo histórico de cada venda e disparando alertas automáticos de estoque baixo, proporcionando uma visão gerencial precisa.

## Principais Funcionalidades
- **Gestão de Catálogo:** Cadastro e categorização de produtos com suporte a hierarquia de marcas e subcategorias.
- **Controle de Estoque:** Monitoramento de entradas, saídas e gatilhos de alerta de estoque baixo.
- **Frente de Caixa (PDV):** Registro rápido de vendas, vinculando clientes e vendedores, garantindo o custo exato do momento da transação.
- **Relatórios Financeiros:** Cálculo de lucro bruto baseado no histórico estático de custos, imune a atualizações posteriores no preço do produto.
- **Gestão de Usuários:** Perfis de acesso para administradores e vendedores.

## Estágio Atual do Desenvolvimento
Atualmente, o projeto encontra-se na fase de consolidação do Front-end e Banco de Dados. A modelagem relacional V2 foi concluída e validada (SQLite), e toda a interface de usuário (UI) foi construída de forma estática com dados mockados. O próximo passo é o desenvolvimento do Back-end.

## Conhecimentos Aplicados
Durante o desenvolvimento das etapas atuais, coloquei em prática:
- **Modelagem Relacional de Banco de Dados:** Aplicação de formas normais (1NF, 2NF e 3NF) para garantir a integridade dos dados e evitar anomalias de atualização em dados financeiros.
- **UI/UX Design e Front-end:** Construção de interfaces responsivas utilizando conceitos modernos de CSS (Flexbox e Grid) a partir de wireframes, sem o uso de frameworks externos.
- **Controle de Versão (Git):** Organização do repositório através da estratégia de branches.

## Tecnologias e Conceitos em Aprendizado
Neste momento, estou aprimorando minha capacidade de estruturar arquiteturas CSS escaláveis (`layout.css`, `components.css`) e manipulando interações de interface unicamente com JavaScript Vanilla. Também venho aprofundando o entendimento de como garantir que a modelagem visual do front-end seja um reflexo fiel da modelagem arquitetural do banco de dados.

## Conhecimentos Futuros
Para a evolução do Porto PDV, pretendo integrar e desenvolver:
- Construção de APIs RESTful utilizando **Python** e o framework **FastAPI**.
- Integração do Front-end com o Back-end através de requisições assíncronas (Fetch API).
- Implementação de autenticação e autorização robustas (JWT).
- Lógica de negócios no lado do servidor para validação de transações e movimentações de estoque reais.

## Arquitetura e Tecnologias
- **Front-end:** HTML5, CSS3, JavaScript (Vanilla).
- **Banco de Dados:** SQLite (com estrutura preparada para fácil migração para PostgreSQL).
- **Back-end:** Python, FastAPI (em planejamento).

A arquitetura adota um modelo cliente-servidor desacoplado. A interface visual e a lógica de apresentação são independentes das regras de negócio e acesso a dados que ficarão no servidor.

## Organização do Repositório (Branches)
O projeto segue um fluxo de trabalho estruturado para garantir estabilidade:
- `main`: Versão consolidada, contendo apenas etapas finalizadas e testadas.
- `develop`: Branch de integração contínua para mesclar o desenvolvimento das funcionalidades.
- `feature/*`: Branches dedicadas ao trabalho isolado (ex: `feature/frontend-design`).

## Estrutura Geral do Projeto
```text
/
├── frontend/      # Interface de usuário (Páginas HTML, estilos CSS e scripts JS estáticos)
├── backend/       # Código-fonte da futura API (Rotas, repositórios e serviços)
├── database/      # Modelagem relacional e dados mockados (schema.sql, seed.sql)
└── docs/          # Documentação oficial, escopo e wireframes
```

---
*Este é um projeto de estudo e portfólio. As informações contidas aqui refletem os esforços de aprendizado na construção de uma aplicação web completa, do banco de dados à interface gráfica.*
