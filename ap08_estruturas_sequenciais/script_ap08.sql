--1.1 Faça um programa que gere um valor inteiro e o exiba.
DO $$
DECLARE
    num INT;
BEGIN
-- random() gera um número real entre 0 (inclusivo) e 1 (exclusivo)
-- floor() arredonda o valor para baixo (ex: 7.9 vira 7)
-- multiplicar por 100 gera um número entre 0 e quase 100
    -- random() → 0.9999999
    -- 0.9999999 * 100 = 99.99999
-- +1 ajusta o intervalo para começar em 1 (ex: se random() der 0, 
-- o resultado final será 1) e se der 99.99 o resultado será 100.99
    --99.99999 + 1 = 100.99999
    --floor(100.99999) = 100
    --random() → 0.0
    --0.0 * 100 = 0
    --0 + 1 = 1
    --floor(1) = 1
    num:= floor(random() * 100 + 1)::INT;
    RAISE NOTICE 'número inteiro aleatório: %', num;
END;
$$

-- 1.2. Faça um programa que gere um valor real e o exiba.
DO $$
DECLARE
    num REAL;
BEGIN
--usar floor(), elimina a parte decimal, o que descaracteriza um número real de verdade (com casas após o ponto)
    num:= random() * 9 + 1; -- vai dar até 10, mas nunca 10, ou seja, até 9.9999999999....
    RAISE NOTICE 'número real aleatório: %', num;
END;
$$
--  1.3 Faça um programa que gere um valor real no intervalo [20, 30] que representa uma
 -- temperatura em graus Celsius. Faça a conversão para Fahrenheit e exiba.

DO $$
DECLARE
    fltTempCelsius REAL;
    fltTempFahrenheit REAL;
BEGIN
    fltTempCelsius:= random() * 10 + 20; -- ex: 0 * 10 + 20 = 20 | 0.9999 * 10 + 20 = 29.9999999
    -- F = C * 9/5 + 32
    fltTempFahrenheit:= (fltTempCelsius * 9/5) + 32;
    RAISE NOTICE 'A temperatural em graus Celsius é de: %', fltTempCelsius;
    RAISE NOTICE 'A temperatural convertida de graus Celsius para Fahrenheit é de: %', fltTempFahrenheit;
END;
$$
-- 1.4 Faça um programa que gere três valores reais a, b, e c e mostre o valor de delta

DO $$
DECLARE
    a REAL;
    b REAL;
    c REAL;
    delta REAL;
BEGIN
    a:= random() * 9 + 1;
    b:= random() * 9 + 1;
    c:= random() * 9 + 1;
-- Calcula delta
    delta := b^2 - 4 * a * c;
    RAISE NOTICE 'O valor de delta é %', delta;
END;
$$

--1.5 Faça umprograma que gere um número inteiro e mostre a raiz cúbica de seu antecessor
 -- e a raiz quadrada de seu sucessor
DO $$
DECLARE
    num INT;
    numAntecessor INT;
    numSucessor INT;
    raizCubica REAL;
    raizQuadrada REAL;
BEGIN
    num:= floor(random() * 100 + 1)::INT;

    numAntecessor:= num - 1;
    numSucessor:= num + 1;
    -- quem está por dentro está por cima (numerador), quem está por fora está por baixo (denominador)
    -- ou seja: 1.0 / 2.0 ou 0.5 → raiz quadrada
    raizQuadrada:= numSucessor  ^ (1.0 / 2.0);
    -- ou seja: 1.0 / 3.0 → raiz cúbica
    raizCubica:= numAntecessor ^ (1.0 / 3.0);

    RAISE NOTICE 'Número gerado: %', num;
    RAISE NOTICE 'Raiz cúbica do antecessor (%): %', numAntecessor, raizCubica;
    RAISE NOTICE 'Raiz quadrada do sucessor (%): %', numSucessor, raizQuadrada;
END;
$$

--  1.6 Faça um programa que gere medidas reais de um terreno retangular. Gere também um
 -- valor real no intervalo [60, 70] que representa o preço por metro quadrado. O programa deve
-- exibir o valor total do terreno
DO $$
DECLARE
    comprimento REAL;
    largura REAL;
    precoM2 REAL;
    area REAL;
    valorTotal REAL;
BEGIN
    -- Gera comprimento e largura entre 1 e 10 m
    comprimento:= random() * 9 + 1;
    largura:= random() * 9 + 1;

    -- Gera preço por metro quadrado entre 60 e 70
    precoM2:= random() * 10 + 60;

    -- Calcula área e valor
    area:= comprimento * largura;
    valorTotal:= area * precoM2;
    -- formatação de valor float com casa decimal, retirando o espaço à esquerda (Fill Mode - modo de preenchimento), 
    -- contando com 5 casas antes da vírgula e 2 casas decimais
    RAISE NOTICE 'Valor total do terreno: R$ %', to_char(valorTotal, 'FM99999.00');
END;
$$
--  1.7 Escreva um programa que gere um inteiro que representa o ano de nascimento de uma
-- pessoa no intervalo [1980, 2000] e gere um inteiro que representa o ano atual no intervalo
-- [2010, 2020]. O programa deve exibir a idade da pessoa em anos. Desconsidere detalhes
-- envolvendo dias, meses, anos bissextos etc

DO $$
DECLARE
    anoNascimento INT;
    anoAtual INT;
    idade INT;
BEGIN
    -- ano entre 1980 e 2000
    anoNascimento:= floor(random() * 21 + 1980)::INT;
    -- ano entre 2010 e 2020
    anoAtual:= floor(random() * 11 + 2010)::INT;
    -- Calcula idade
    idade:= anoAtual - anoNascimento;
    -- validar valores
    -- RAISE NOTICE 'Ano de nascimento: %', anoNascimento;
    -- RAISE NOTICE 'Ano atual: %', anoAtual;
    -- saída solicitada
    RAISE NOTICE 'Idade: % anos', idade;
END;
$$