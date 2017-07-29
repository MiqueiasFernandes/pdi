
OVERVIEW

o método getColor obtem uma cor HSI dada uma cor rgb, HSI ou seu nome em ingles
o método rgb2hsi transforma uma imagem de RGB para HSI
o método hsi2rgb transforma uma imagem de HSI para RGB
o método alterarCor troca uma cor de uma figura HSI para outra cor em rgb, HSI ou seu nome em ingles

O método trocarCor é responsável por alterar a cor de uma imagem para uma outra cor

o quarto parametro desta função informa o quão parecida com a cor deve ser as cores a serem substituidas,
para isso deve-se informar a variação aceitavel com um numero entre 0 e 1
onde 0    indica exatamente a cor informada
e    0.5  por exemplo, indica cor no modelo HSI entre [ corH +- 0.5, corS +- 0.5, corI +- 0.5]
e    1    indica qualquer cor
por exemplo:

pode-se trocar uma unica cor        use zero no quarto parâmetro
trocarCor(figura, '7f5dae', 'blue',----------> 0 <------------)

pode-se trocar cores proximas a cor informada          use um numero entre 0 e 1 sendo que
trocarCor(figura, '7f5dae', 'blue',-----------------------> 0.2 <--------------------)

USO

figura = imread('FigurasTeste/teste1.jpg'); %%% figura da flor
nova = trocarCor(figura, '7f5dae', 'blue', 0.2) %%%muda cor das petalas roxas das flores para azul
imshow(nova)  %%%exibe a figura
