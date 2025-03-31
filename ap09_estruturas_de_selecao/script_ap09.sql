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