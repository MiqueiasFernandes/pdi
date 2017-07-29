%====================================================
%\file alterarCor.m
%\title Trabalho de PDI − 2017/1
%\author Leonardo Moreli e Miquéias Fernandes
%\date 2017−07−22
%
% Este arquivo auxilia a solucao do problema,
% o programa deve ser executado da seguinte forma:
% alterarCor(imagemHSI, cor, cor, variancia)
% onde cor deve estar em RGB, nome, ou HSI
% e variancia é um numero entre 0 e 1 que determina quais cores próximas a
% esta serão tambem selecionadas
%====================================================
function hsi_image = alterarCor(img_hsi, cor, substituta, variancia)

H = img_hsi(:, :, 1);
S = img_hsi(:, :, 2);
I = img_hsi(:, :, 3);

[ L , C ] = size ( I ) ;

cor1 = getColor(cor);
cor2 = getColor(substituta);

variancia = abs(variancia);

for i = 1:L
    for j = 1:C
        if H(i, j) == cor1(1) && S(i, j) == cor1(2) && I(i, j) == cor1(3) || (variancia > 0 && (abs(H(i, j) - cor1(1)) <= variancia && abs(S(i, j) - cor1(2)) <= variancia && abs(I(i, j) - cor1(3)) <= variancia))
            H(i, j) = cor2(1);
            S(i, j) = cor2(2);
            I(i, j) = cor2(3);
        end
    end
end

hsi_image = zeros ( size ( img_hsi ) ) ;
hsi_image ( : , : , 1 ) = H;
hsi_image ( : , : , 2) = S;
hsi_image ( : , : , 3) = I;
