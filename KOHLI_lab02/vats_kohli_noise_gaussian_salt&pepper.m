
%load image and make a histogram%
IN = imread('image path');
IN=double(IN);
figure,image(IN),colormap gray(256), title('normal image')
figure, imhist(uint8(IN),256), title('normal image')
%add gausian matrix using given standard deviation to the image%
sd = 20;
OUT = (IN)+sd.*randn(size(IN)); %(20%) standard deviation %
figure, image(OUT), colormap gray(256), title('Noise by standard deviation')
figure, imhist(uint8(OUT),256), title('Noise by standard deviation')
%salt&pepper noise%

[m,n] = size(IN);
max_value = 255;
% we use full(SPRAND) to create a random a -by- b sparse matrix which will be converted to full storage organisation with approximately density*m*n uniformly distributed in intervals[0,1].%
s = full(sprand(m, n, 0.2)); % 20% density of salt and pepper %
L1 = s>0 & s<0.5;
L2 = s>=0.5;
% L being divided into L1 and L2. %
OUT1 = IN.*(~L1);
OUT1 = OUT1.*(~L2) + max_value*(L2);

figure, image(OUT1), colormap gray(256), title('salt & pepper noise') % image OUT1 has both standard deviation and salt & pepper as noise %
figure, imhist(uint8(OUT1),256), title('salt & pepper noise')
