# Escopo do Projeto - Sistema de Vendas

Este projeto é um Sistema de Vendas (PDV) focado em lojas especializadas em tecnologia, informática, games, eletrônicos, produtos importados e colecionáveis.

## Objetivos
Fornecer uma interface unificada e intuitiva para gerenciar catálogo de produtos, clientes, realizar vendas e acompanhar o desempenho da loja através de um dashboard e relatórios, controlando automaticamente os níveis de estoque.

## Entidades e Fluxos Principais
- **Usuários (Vendedores/Administradores):** Acesso autenticado para operar o sistema.
- **Configurações Globais:** Parâmetros de negócio (Estoque mínimo padrão).
- **Clientes:** Cadastro básico para acompanhamento de vendas.
- **Catálogo:** Hierarquia de Marcas, Categorias, Subcategorias e Produtos.
- **Estoque:** Controle de entradas/saídas e alertas de estoque baixo.
- **Vendas:** Processo de venda que atrela itens, custos históricos, vendedor, cliente, pagamentos e dá baixa automática em estoque.

## Fora de Escopo (Versão Atual)
- E-commerce voltado ao cliente final (B2C).
- Integração fiscal automática (NF-e).
