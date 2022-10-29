-- 1º QUERY

SELECT * FROM produto WHERE preco>50

-- 2º QUERY

SELECT * FROM produto WHERE estoque!=0 AND preco<=100

-- 3º QUERY

SELECT 
	descricao AS "Nome do Produto", 
	preco AS "Preço do Produto" 
	
FROM 
	produto 
	
WHERE 
	estoque>0 
	
ORDER BY 
	descricao

-- 4º QUERY

SELECT
	nome,
	count(p) AS Total_de_Vendas
FROM 
	funcionario f
LEFT JOIN pedido p ON f.id = p.vendedor_id
GROUP BY(f.nome)

-- 5º QUERY

SELECT g.nome AS "Gestor",
	   f.nome AS "Funcionários",
	   Count(p) "Total de Vendas"
	
	
	