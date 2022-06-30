IN = imread('image path');
IN=double(IN);

%LINEAR FILTERS%

B = zeros(7,7);
% this will shift image to left and up %
B(4,4) =1;
OUTL1 =  conv2(IN, B);
figure, imagesc(OUTL1), colormap gray, title('linear filter')
figure, surf(OUTL1), title('linear filter')

C = ones(7)/9; % BLURRING WITH BOX FILTERING %
OUTL2 = conv2(IN, C);
figure, imagesc(OUTL2), colormap gray, title('linear BOX filter')
figure, surf(OUTL2), title('linear BOX filter')

E =2*filter7-ones(7,7)/9; % SHARPENING FILTER %
OUTL3 = conv2(IN, E);
figure, imagesc(OUTL3), colormap gray, title('linear SHARPENING filter')
figure, surf(OUTL3), title('linear SHARPENING filter')
