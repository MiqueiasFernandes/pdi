%====================================================
%\file rgb2hsi.m
%\title Trabalho de PDI − 2017/1
%\author Juliana Amorim Guimarães
%\date 2017−07−17
%
% Este arquivo auxilia a solucao do problema
% proposto, o programa deve ser executado da seguinte forma:
% imageHSI = rgb2hsi(imageRGB) 
%====================================================
function hsi_image = rgb2hsi(rgbimage)

R = double( rgbimage( : , : , 1) ) / 255.0 ;
G = double ( rgbimage( : , : , 2) ) / 255.0 ;
B = double ( rgbimage( : , : , 3) ) / 255.0 ;
I = (R + G + B) / 3 ;

temp = (R - G).*(R - G) + (R - B).*(G - B) ;
temp ( : , : ) = sqrt( double( temp ( : , : ) ) );
[ L , C ] = size ( temp ) ;
S = zeros ( [ L C ] ) ; 
S = double(S);
H = S;

for i =1:L
    for j = 1:C
        if ( R( i , j ) + G( i , j ) + B( i , j ) ) ~= 0
            S( i , j )=1-(3*min ( min (R( i , j ) ,G( i , j ) ) ,B( i , j ) ) ) / (R( i , j ) + G ( i , j ) +B( i , j ) ) ;
        end
        if ( temp ( i , j ) > 0 )
            H( i , j ) = acos( 0.5 * ( 2 *R( i , j ) - G( i , j ) - B( i , j ) ) / temp ( i , j ) ) ;
            if (B( i , j ) > G( i , j ) )
                H( i , j ) = 2* pi - H( i , j ) ;
            end
        end
    end
end

H = H / ( 2 * pi ) ;
hsi_image = zeros ( size ( rgbimage ) ) ;
hsi_image ( : , : , 1 ) = H;
hsi_image ( : , : , 2) = S;
hsi_image ( : , : , 3) = I;