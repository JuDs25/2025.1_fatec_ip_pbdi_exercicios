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
