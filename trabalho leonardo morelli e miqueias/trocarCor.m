%====================================================
%\file trocarCor.m
%\title Trabalho de PDI − 2017/1
%\author Leonardo Moreli e Miquéias Fernandes
%\date 2017−07−22
%
% Este arquivo implenta a solucao do problema
% proposto usando o algoritmo:
%
% 1. Ler a imagem de entrada.
% 2. Converter a imagem RGB para HSI.
% 3. Trocar apenas o valor da cor, no modelo HSI.
% 4. Finalmente, chama-se a função de conversão do HSI para RGB passando como 
%    parâmetro esta nova imagem HSI alterada.
%
% Para usar a solucao desenvolvida , o programa deve ser executado
% da seguinte forma:
% trocarCor( imagemRGB, COR, COR, VARIAÇÃO )
% onde imagemRGB é uma matriz oriunda de imread()
% onde COR é uma cor:
% hexadecimal (por exemplo: 'ffffff') ou
% nome em ingles (por exemplo: 'yellow') ou
% em HSI (por exemplo: [ 0 0 1])
% E ainda, a primeira cor de parâmetro é a cor A SER alterada,
% a segunda cor é a cor que SUBSTITUIRÁ a cor alterada
% e variancia é um numero entre 0 e 1 que determina quais cores próximas a
% esta serão tambem selecionadas, para uma unica cor use 0
% exemplo de uso:
% imshow(trocarCor(imread("imagem.jpg"), "black", "blue", 0))
% imshow(trocarCor(imread('pimentoes.bmp'), 'red', 'blue', 0.5))
% imshow(trocarCor(imread('FigurasTeste/teste1.jpg'), '7f5dae', 'blue', 0.2))
%====================================================
function image = trocarCor(image, cor, substituta, variancia)

image  = hsi2rgb(alterarCor(rgb2hsi(image), cor, substituta, variancia));