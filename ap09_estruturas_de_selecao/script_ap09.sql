-- Criando a função de valor aleatório
CREATE OR REPLACE FUNCTION valor_aleatorio_entre (lim_inferior INT, lim_superior
 INT) RETURNS INT AS
 $$
 BEGIN
 RETURN FLOOR(RANDOM() * (lim_superior - lim_inferior + 1) + lim_inferior)::INT;
 END;
 $$ LANGUAGE plpgsql;

-- 1.1 Faça um programa que exibe se um número inteiro é múltiplo de 3
-- SOLUÇÃO 1.1 - Com apenas IF e suas variações
DO $$
DECLARE
    -- Gerar um número inteiro aleatório entre 1 e 30
    numero INT:= valor_aleatorio_entre(1, 30);
BEGIN
    -- Verificar se esse número é múltiplo de 3, o que significa que ao dividir esse número por 3, o resto da divisão é zero.
    -- SE o resto da divisão por 3 do numero der 0, então é múltiplo. 
    IF numero % 3 = 0 THEN
        RAISE NOTICE 'O numero % é múltiplo de 3', numero;
    ELSE
        RAISE NOTICE 'O numero % não é múltiplo de 3', numero;
    END IF;
END;
$$

-- SOLUÇÃO 2.1 - Com apenas CASE e suas variações
DO $$
DECLARE
    -- Gerar um número inteiro aleatório entre 1 e 30
    numero INT:= valor_aleatorio_entre(1, 30);
BEGIN
    -- Verificar se esse número é múltiplo de 3, o que significa que ao dividir esse número por 3, o resto da divisão é zero.
    -- SE o resto da divisão por 3 do numero der 0, então é múltiplo. 
    CASE
        WHEN numero % 3 = 0 THEN
            RAISE NOTICE 'O numero % é múltiplo de 3', numero;
        ELSE
            RAISE NOTICE 'O numero % não é múltiplo de 3', numero;
    END CASE;
END;
$$

-- 1.2 Faça um programa que exibe se um número inteiro é múltiplo de 3 ou de 5.
-- SOLUÇÃO 1.2 - Com apenas IF e suas variações
DO $$
DECLARE
    -- Gerar um número inteiro aleatório entre 1 e 100
    numero INT:= valor_aleatorio_entre(1, 100);
BEGIN
    -- Verificar se esse número é múltiplo de 3 ou de 5, o que significa que ao dividir esse número por 3 ou 5, o resto da divisão é zero.
    -- SE o resto da divisão por 3 ou 5 do numero der 0, então é múltiplo. 
    IF numero % 3 = 0 OR numero % 5 = 0 THEN
        RAISE NOTICE 'O numero % é múltiplo de 3 ou de 5.', numero;
    ELSE
        RAISE NOTICE 'O numero % não é múltiplo de 3 e nem de 5.', numero;
    END IF;
END;
$$

-- SOLUÇÃO 2.2 - Com apenas CASE e suas variações
DO $$
DECLARE
    -- Gerar um número inteiro aleatório entre 1 e 100
    numero INT:= valor_aleatorio_entre(1, 100);
BEGIN
    -- Verificar se esse número é múltiplo de 3 ou de 5, o que significa que ao dividir esse número por 3 ou 5, o resto da divisão é zero.
    -- SE o resto da divisão por 3 ou 5 do numero der 0, então é múltiplo. 
    CASE
        WHEN (numero % 3 = 0) OR (numero % 5 = 0) THEN
            RAISE NOTICE 'O numero % é múltiplo de 3 ou de 5.', numero;
        ELSE
            RAISE NOTICE 'O numero % não é múltiplo de 3 e nem de 5.', numero;
    END CASE;
END;
$$

--  1.3 Faça um programa que opera de acordo com o seguinte menu.
-- Opções:
--  1 - Soma
--  2 - Subtração
--  3 - Multiplicação
--  4 - Divisão
--  Cada operação envolve dois números inteiros. O resultado deve ser exibido no formato
--  Exemplo:
--  op1 op op2 = res
--  2 + 3 = 5

-- SOLUÇÃO 1.3 - Com apenas IF e suas variações
DO $$
DECLARE
    -- opções de números
    op1 INT:= valor_aleatorio_entre(1, 100);
    op2 INT:= valor_aleatorio_entre(1, 100);
    -- opções das 4 operações matemáticas do menu
    op INT:= valor_aleatorio_entre(1, 4);
    -- resultado esperado
    res NUMERIC;
BEGIN
    IF op = 1 THEN
        res:= op1 + op2;
        RAISE NOTICE '% + % = %', op1, op2, res;
    ELSIF op = 2 THEN
        res:= op1 - op2;
        RAISE NOTICE '% - % = %', op1, op2, res;
    ELSIF op = 3 THEN
        res:= op1 * op2;
        RAISE NOTICE '% * % = %', op1, op2, res;
    ELSIF op = 4 THEN
        res:= op1::NUMERIC / op2;
        RAISE NOTICE '% / % = %', op1, op2, res;
    END IF;
END;
$$

-- SOLUÇÃO 2.3 - Com apenas CASE e suas variações
DO $$
DECLARE
    -- opções de números
    op1 INT:= valor_aleatorio_entre(1, 100);
    op2 INT:= valor_aleatorio_entre(1, 100);
    -- opções das 4 operações matemáticas do menu
    op INT:= valor_aleatorio_entre(1, 4);
    -- resultado esperado
    res NUMERIC;
BEGIN
    CASE
        WHEN op = 1 THEN
            res:= op1 + op2;
                RAISE NOTICE '% + % = %', op1, op2, res;
        WHEN op = 2 THEN
            res:= op1 - op2;
                RAISE NOTICE '% - % = %', op1, op2, res;
        WHEN op = 3 THEN
            res:= op1 * op2;
                RAISE NOTICE '% * % = %', op1, op2, res;
        WHEN op = 4 THEN
            res:= op1::NUMERIC / op2;
                RAISE NOTICE '% / % = %', op1, op2, res;
    END CASE;
END;
$$

--  1.4 Um comerciante comprou um produto e quer vendê-lo com um lucro de 45% se o valor
 -- da compra for menor que R$20. Caso contrário, ele deseja lucro de 30%. Faça um
 -- programa que, dado o valor do produto, calcula o valor de venda

 -- SOLUÇÃO 1.4 - Com apenas IF e suas variações
DO $$
DECLARE
    valorProduto REAL:= valor_aleatorio_entre(1, 100);
    valorVenda REAL;
BEGIN
    IF valorProduto < 20 THEN
        valorVenda:= valorProduto + (valorProduto * 0.45);
        RAISE NOTICE 'O valor da venda é de R$ %', valorVenda;
    ELSE
        valorVenda:= valorProduto + (valorProduto * 0.30);
        RAISE NOTICE 'O valor da venda é de R$ %', valorVenda;
    END IF;
END;
$$

-- SOLUÇÃO 2.4 - Com apenas CASE e suas variações
DO $$
DECLARE
    valorProduto REAL:= valor_aleatorio_entre(1, 100);
    valorVenda REAL;
BEGIN
    CASE
        WHEN
            valorProduto < 20 THEN
                valorVenda:= valorProduto + (valorProduto * 0.45);
                    RAISE NOTICE 'O valor da venda é de R$ %', valorVenda;
        ELSE
            valorVenda:= valorProduto + (valorProduto * 0.30);
                RAISE NOTICE 'O valor da venda é de R$ %', valorVenda;
    END CASE;
END;
$$
-- 1.5 Resolva o problema disponível no link a seguir.
-- https://www.beecrowd.com.br/judge/en/problems/view/1048

 -- SOLUÇÃO 1.5 - Com apenas IF e suas variações
DO $$
DECLARE
    salarioAtual REAL:= valor_aleatorio_entre(1, 50000);
    valorPercentual INTEGER;
    valorReajuste REAL;
    salarioReajuste REAL;
BEGIN
    IF salarioAtual <= 400.00 THEN
        valorPercentual:= 15;
    ELSIF salarioAtual <= 800.00 THEN
        valorPercentual:= 12;
    ELSIF salarioAtual <= 1200.00 THEN
        valorPercentual:= 10;
    ELSIF salarioAtual <= 2000.00 THEN
        valorPercentual:= 7;
    ELSE
       valorPercentual:= 4;
    END IF;
    -- valor do reajuste em porcentagem
    valorReajuste:= salarioAtual * valorPercentual / 100;
    salarioReajuste:= salarioAtual + valorReajuste;

    -- Print dos resultados conforme solicitado no "problema 1048 do Beecrowd"
    RAISE NOTICE 'Salário atual: R$ %', salarioAtual;
    RAISE NOTICE 'Reajuste Percentual % %%', valorPercentual;
    RAISE NOTICE 'Reajuste ganho: R$ %', valorReajuste;
    RAISE NOTICE 'Novo salário: R$ %', salarioReajuste;
END;
$$

-- SOLUÇÃO 2.5 - Com apenas CASE e suas variações
DO $$
DECLARE
    salarioAtual REAL:= valor_aleatorio_entre(1, 50000);
    valorPercentual INTEGER;
    valorReajuste REAL;
    salarioReajuste REAL;
BEGIN
    CASE
        WHEN
            salarioAtual <= 400.00 THEN
                valorPercentual:= 15;
        WHEN
            salarioAtual <= 800.00 THEN
                valorPercentual:= 12;
        WHEN salarioAtual <= 1200.00 THEN
                valorPercentual:= 10;
        WHEN
            salarioAtual <= 2000.00 THEN
                valorPercentual:= 7;
        ELSE
            valorPercentual:= 4;
    END CASE;
    -- valor do reajuste em porcentagem
    valorReajuste:= salarioAtual * valorPercentual / 100;
    salarioReajuste:= salarioAtual + valorReajuste;

    -- Print dos resultados conforme solicitado no "problema 1048 do Beecrowd"
    RAISE NOTICE 'Salário atual: R$ %', salarioAtual;
    RAISE NOTICE 'Reajuste Percentual % %%', valorPercentual;
    RAISE NOTICE 'Reajuste ganho: R$ %', valorReajuste;
    RAISE NOTICE 'Novo salário: R$ %', salarioReajuste;
END;
$$