-- database: sistema_vendas.db
PRAGMA foreign_keys = ON;

-- =========================================================
-- 1. USUARIOS
-- =========================================================
CREATE TABLE usuarios (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    senha_hash TEXT NOT NULL,
    cargo TEXT NOT NULL,
    avatar_url TEXT,
    ativo INTEGER NOT NULL DEFAULT 1,
    data_cadastro TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CHECK (
        cargo IN ('ADMINISTRADOR', 'VENDEDOR')
    )
);

-- =========================================================
-- 2. CONFIGURACOES_SISTEMA
-- =========================================================
CREATE TABLE configuracoes_sistema (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_loja TEXT NOT NULL,
    cnpj TEXT,
    endereco_principal TEXT,
    alerta_estoque_baixo INTEGER NOT NULL DEFAULT 1,
    estoque_minimo_padrao INTEGER NOT NULL DEFAULT 5,
    data_atualizacao TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- =========================================================
-- 3. CLIENTES
-- =========================================================
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    telefone TEXT,
    email TEXT,
    endereco TEXT,
    cidade TEXT,
    estado TEXT,
    data_cadastro TEXT NOT NULL DEFAULT CURRENT_DATE,
    ativo INTEGER NOT NULL DEFAULT 1
);

-- =========================================================
-- 4. CATEGORIAS
-- =========================================================
CREATE TABLE categorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    descricao TEXT,
    ativo INTEGER NOT NULL DEFAULT 1
);

-- =========================================================
-- 5. SUBCATEGORIAS
-- =========================================================
CREATE TABLE subcategorias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    categoria_id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    descricao TEXT,
    ativo INTEGER NOT NULL DEFAULT 1,

    FOREIGN KEY (categoria_id)
        REFERENCES categorias(id),

    UNIQUE (categoria_id, nome)
);

-- =========================================================
-- 6. MARCAS
-- =========================================================
CREATE TABLE marcas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL UNIQUE,
    ativo INTEGER NOT NULL DEFAULT 1
);

-- =========================================================
-- 7. PRODUTOS
-- =========================================================
CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subcategoria_id INTEGER NOT NULL,
    marca_id INTEGER NOT NULL,
    codigo TEXT NOT NULL UNIQUE,
    nome TEXT NOT NULL,
    descricao TEXT,
    custo NUMERIC NOT NULL,
    preco NUMERIC NOT NULL,
    estoque_atual INTEGER NOT NULL DEFAULT 0,
    estoque_minimo INTEGER NOT NULL DEFAULT 0,
    data_cadastro TEXT NOT NULL DEFAULT CURRENT_DATE,
    ativo INTEGER NOT NULL DEFAULT 1,

    FOREIGN KEY (subcategoria_id)
        REFERENCES subcategorias(id),

    FOREIGN KEY (marca_id)
        REFERENCES marcas(id),

    CHECK (custo >= 0),
    CHECK (preco >= 0),
    CHECK (estoque_atual >= 0),
    CHECK (estoque_minimo >= 0)
);

-- =========================================================
-- 8. VENDAS
-- =========================================================
CREATE TABLE vendas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER NOT NULL,
    usuario_id INTEGER NOT NULL,
    data_venda TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    desconto NUMERIC NOT NULL DEFAULT 0,
    total NUMERIC NOT NULL,
    canal TEXT NOT NULL,
    status TEXT NOT NULL,

    FOREIGN KEY (cliente_id)
        REFERENCES clientes(id),

    FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id),

    CHECK (desconto >= 0),
    CHECK (total >= 0),

    CHECK (
        canal IN ('LOJA_FISICA', 'ONLINE')
    ),

    CHECK (
        status IN ('ABERTA', 'CONCLUIDA', 'CANCELADA')
    )
);

-- =========================================================
-- 9. ITENS DA VENDA
-- =========================================================
CREATE TABLE itens_venda (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER NOT NULL,
    produto_id INTEGER NOT NULL,
    quantidade INTEGER NOT NULL,
    custo_unitario NUMERIC NOT NULL,
    preco_unitario NUMERIC NOT NULL,

    FOREIGN KEY (venda_id)
        REFERENCES vendas(id),

    FOREIGN KEY (produto_id)
        REFERENCES produtos(id),

    CHECK (quantidade > 0),
    CHECK (custo_unitario >= 0),
    CHECK (preco_unitario >= 0)
);

-- =========================================================
-- 10. PAGAMENTOS
-- =========================================================
CREATE TABLE pagamentos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    venda_id INTEGER NOT NULL,
    forma_pagamento TEXT NOT NULL,
    valor NUMERIC NOT NULL,
    status TEXT NOT NULL,
    data_pagamento TEXT,

    FOREIGN KEY (venda_id)
        REFERENCES vendas(id),

    CHECK (valor > 0),

    CHECK (
        forma_pagamento IN (
            'PIX',
            'DINHEIRO',
            'CREDITO',
            'DEBITO'
        )
    ),

    CHECK (
        status IN (
            'PENDENTE',
            'PAGO',
            'CANCELADO'
        )
    )
);

-- =========================================================
-- 11. MOVIMENTACOES DE ESTOQUE
-- =========================================================
CREATE TABLE movimentacoes_estoque (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    produto_id INTEGER NOT NULL,
    venda_id INTEGER,
    tipo_movimentacao TEXT NOT NULL,
    quantidade INTEGER NOT NULL,
    data_movimentacao TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observacao TEXT,

    FOREIGN KEY (produto_id)
        REFERENCES produtos(id),

    FOREIGN KEY (venda_id)
        REFERENCES vendas(id),

    CHECK (quantidade > 0),

    CHECK (
        tipo_movimentacao IN (
            'ENTRADA',
            'SAIDA'
        )
    )
);
