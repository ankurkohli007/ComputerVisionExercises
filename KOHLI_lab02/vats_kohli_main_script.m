
% Part 1.%
%load image and make a histogram%
IN = imread('E:\genova_sem_1\CV\Lab2_testimages\tree.png','png');% the paath of sample image in my system
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

% PART 2. %
% Removing noise by moving average %
% the moving average filter is a more direct approach to simply "smoothing out" a signal % 
K = ones(3)/9; % (3x3) kernel %
A = ones(7)/99; % (7x7) kernel %
OUTA = conv2(OUT, K);
OUTB = conv2(OUT, A);
figure, imagesc(OUTA), colormap gray, title ('moving avg. by 3x3')
figure, surf(OUTA), imhist(uint8(OUTA),256), title ('moving avg. by 3x3')
figure, imagesc(OUTB), colormap gray, title('moving avg. by 7x7')
figure, surf(OUTB), imhist(uint8(OUTB),256), title('moving avg. by 7x7')

%low-pass gaussian filter %
x= 33; % size of the filter %
for sigma = 6 % sigma for one time blurring %
    t = fspecial('gaussian', x, sigma); % Create predefined 2-D filter and used with imfilter%
    OUTG = imfilter(OUT, t);
end
figure, imagesc(OUTG), colormap gray, title('gausian filter')
figure, surf(OUTG), imhist(uint8(OUTG),256), title('gausian filter')

% medianfilter %

OUTM = medfilt2(OUT1, [3,3]); % removes salt & pepper noise 2D filter %
figure, imagesc(OUTM), colormap gray, title('median filter 3x3 matrix')
figure, surf(OUTM), imhist(uint8(OUTM), 256), title(' med. 3x3 filter')
OUTM1 = medfilt2(OUT1, [7,7]); % removes salt & pepper noise 2D filter %
figure, imagesc(OUTM1), colormap gray, title('median filter 7x7 matrix')
figure, surf(OUTM1), imhist(uint8(OUTM1), 256), title(' med. 7x7 filter')

% PART- 3 %

%LINEAR FILTERS%

B = zeros(7,7);% creating a 7x7 zero matrix
B(4,4) =1; %making the centre of matrix to be one.
OUTL1 =  conv2(IN, B);
figure, imagesc(OUTL1), colormap gray, title('linear filter')
figure, surf(OUTL1), title('linear filter')
U = zeros(7,7);
U(1,1) =1; %shifting towards right and up will take place.
OUTL2 = conv2(IN, U);
figure, imagesc(OUTL2), colormap gray, title('shifting linear filter')
figure, surf(OUTL2), title('shifting linear filter')

C = ones(7)/9; % BLURRING WITH BOX FILTERING %
OUTL3 = conv2(IN, C);
figure, imagesc(OUTL3), colormap gray, title('linear BOX filter')
figure, surf(OUTL3), title('linear BOX filter')

E =2*B-ones(7,7)/9; % SHARPENING FILTER %
OUTL4 = conv2(IN, E);
figure, imagesc(OUTL4), colormap gray, title('linear SHARPENING filter')
figure, surf(OUTL4), title('linear SHARPENING filter')

% PART- 4 %
% FFT %

OUTF = fftshift(fft2(OUTL1));
OUTF = log(abs(OUTF));
figure, imagesc(OUTF), colormap gray, title('magnitude(log) of linear filtered image')
OUTF1 = fftshift(fft2(OUTL2));
OUTF1 = log(abs(OUTF1));
figure, imagesc(OUTF1), colormap gray, title('magnitude(log) of shifted linear filtered image')
OUTF2 = fftshift(fft2(OUTL3));
OUTF2 = log(abs(OUTF2));
figure, imagesc(OUTF2), colormap gray, title('magnitude(log) of box filtered image')
OUTF3 = fftshift(fft2(OUTL4));
OUTF3 = log(abs(OUTF3));
figure, imagesc(OUTF3), colormap gray, title('magnitude(log) of sharpening filtered image')


%  low-pass Gaussian filter %
P = rand(101,101);
F = (fft2(P));
G = fftshift(F);
[Q,W] = size(F);
SIGMA = 5;
X = 1:W-1;
Y = 1:Q-1;

Cx=0.5*W;
Cy=0.5*Q;
OUTGF =exp(-((X-Cx).^2+(Y-Cy).^2)./(2*SIGMA)^2);
O1 = log(abs(fftshift(fft2(OUTGF))));
figure, imagesc(OUTGF), colormap gray, title ('Gaussian low pass fft with 101x101 spatial and 5 sigma')
figure, imagesc(O1), colormap gray, title ('fft of gaussian low pass filter')
% transformed sharpening filter %

T = zeros(101, 101);
for i=1:7
    for j=1:7
        T(i+47, j+47) = E(i,j); %making the filter same as the 7x7 filter%
    end
end

R = fftshift(fft2(T)); % applying fft in T filter.%
OUTT = log(abs(R));
OUTF1 = conv2(IN,OUTT);
figure, imagesc(OUTT), colormap gray, title ('Magnitude of the fourier transformed sharpening filter') 
figure, imagesc(OUTF1),colormap gray, title ('Magnitude of the transformed sharpening filter') % convoluting filter T with IN image%



