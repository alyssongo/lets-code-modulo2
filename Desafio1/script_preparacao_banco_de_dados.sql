create type enum_cargo AS ENUM ('Vendedor', 'Gerente');

create table funcionario (
	id 			int generated always as identity, 
	nome 		varchar(100) not null, 
	cargo 		enum_cargo not null, 
	gerente_id 	int null,
	primary key (id),
	constraint fk_funcionario_gerente
		foreign key (gerente_id)
			references funcionario(id)
);

create table pedido (
	id 					int generated always as identity, 
	vendedor_id 		int not null,
	endereco_entrega 	varchar(200) not null,
	preco_total			numeric(5, 2) not null,
	data_pedido			timestamp not null default now(),
	primary key (id),
	constraint fk_pedido_vendedor
		foreign key (vendedor_id)
			references funcionario(id)
);

create table produto (
	id 			int generated always as identity, 
	descricao 	varchar(100) not null,
	estoque		int not null,
	preco		numeric(5, 2),
	primary key (id)
);

create table item_pedido (
	pedido_id int not null,
	produto_id int not null,
	primary key (pedido_id, produto_id),
	constraint fk_item_pedido_pedido
		foreign key (pedido_id)
			references pedido(id),
	constraint fk_item_pedido_produto
		foreign key (produto_id)
			references produto(id)
);

-- Produtos

INSERT INTO produto (descricao, estoque, preco)
VALUES ('Coca-Cola', 100, 99.99),
       ('Pepsi', 87, 88.2),
       ('Fanta', 200, 205.5),
       ('Dolinho', 0, 90);

-- Gerentes

INSERT INTO funcionario (nome, cargo)
VALUES ('Andrew Love', 'Gerente'),
       ('Ollie Harvey', 'Gerente');

-- Vendedores

INSERT INTO funcionario (nome, cargo, gerente_id)
VALUES ('Clarence Ferguson', 'Vendedor', (SELECT id FROM funcionario WHERE nome = 'Andrew Love' )),
       ('Stella Lowe', 'Vendedor', (SELECT id FROM funcionario WHERE nome = 'Ollie Harvey' )),
       ('Allie Sandoval', 'Vendedor', (SELECT id FROM funcionario WHERE nome = 'Andrew Love' )),
       ('Hester Matthews', 'Vendedor', (SELECT id FROM funcionario WHERE nome = 'Andrew Love' )),
       ('Sarah Maldonado', 'Vendedor', (SELECT id FROM funcionario WHERE nome = 'Ollie Harvey' ));

-- Pedidos

INSERT INTO pedido (vendedor_id, endereco_entrega, preco_total)
VALUES ((SELECT id FROM funcionario WHERE nome = 'Sarah Maldonado' ), 'Rua Logradouro, 999', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Allie Sandoval' ), 'Rua Logradouro, 123', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Allie Sandoval' ), 'Rua Logradouro, 111', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Allie Sandoval' ), 'Rua Logradouro, 456', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Stella Lowe' ), 'Rua Logradouro, 774', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Allie Sandoval' ), 'Rua Logradouro, 876', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Allie Sandoval' ), 'Rua Logradouro, 462', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Stella Lowe' ), 'Rua Logradouro, 189', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Sarah Maldonado' ), 'Rua Logradouro, 982', 0),
       ((SELECT id FROM funcionario WHERE nome = 'Sarah Maldonado' ), 'Rua Logradouro, 363', 0);

-- Itens de pedido

INSERT INTO item_pedido (pedido_id, produto_id)
VALUES ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 999' ), (SELECT id FROM produto WHERE descricao = 'Coca-Cola' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 999' ), (SELECT id FROM produto WHERE descricao = 'Fanta' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 123' ), (SELECT id FROM produto WHERE descricao = 'Pepsi' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 111' ), (SELECT id FROM produto WHERE descricao = 'Dolinho' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 111' ), (SELECT id FROM produto WHERE descricao = 'Fanta' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 456' ), (SELECT id FROM produto WHERE descricao = 'Coca-Cola' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 456' ), (SELECT id FROM produto WHERE descricao = 'Pepsi' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 456' ), (SELECT id FROM produto WHERE descricao = 'Fanta' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 774' ), (SELECT id FROM produto WHERE descricao = 'Fanta' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 876' ), (SELECT id FROM produto WHERE descricao = 'Coca-Cola' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 876' ), (SELECT id FROM produto WHERE descricao = 'Pepsi' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 876' ), (SELECT id FROM produto WHERE descricao = 'Fanta' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 876' ), (SELECT id FROM produto WHERE descricao = 'Dolinho' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 462' ), (SELECT id FROM produto WHERE descricao = 'Dolinho' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 462' ), (SELECT id FROM produto WHERE descricao = 'Fanta' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 189' ), (SELECT id FROM produto WHERE descricao = 'Pepsi' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 982' ), (SELECT id FROM produto WHERE descricao = 'Pepsi' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 982' ), (SELECT id FROM produto WHERE descricao = 'Dolinho' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 363' ), (SELECT id FROM produto WHERE descricao = 'Coca-Cola' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 363' ), (SELECT id FROM produto WHERE descricao = 'Fanta' )),
       ((SELECT id FROM pedido WHERE endereco_entrega = 'Rua Logradouro, 363' ), (SELECT id FROM produto WHERE descricao = 'Dolinho' ));

-- Atualiza total dos pedidos

UPDATE pedido
SET preco_total = precos.preco_total
FROM pedido p
INNER JOIN
  (SELECT p.id,
          sum(p2.preco) AS preco_total
   FROM pedido p
   INNER JOIN item_pedido ip ON p.id = ip.pedido_id
   INNER JOIN produto p2 ON ip.produto_id = p2.id
   GROUP BY p.id) AS precos ON p.id = precos.id
WHERE pedido.id = p.id