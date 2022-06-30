% Removing noise by moving average %
% the moving average filter is a more direct approach to simply "smoothing out" a signal % 
IN = imread('image path');
IN=double(IN);
K = ones(3)/9; % (3x3) kernel %
A = ones(7)/99; % (7x7) kernel %
OUTA = conv2(IN, K);
OUTB = conv2(IN, A);
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

OUTM = medfilt2(%image with salt and pepper noise%, [3,3]); 
% removes salt & pepper noise 2D filter %
figure, imagesc(OUTM), colormap gray, title('median filter 3x3 matrix')
figure, surf(OUTM), imhist(uint8(OUTM), 256), title(' med. 3x3 filter')
OUTM1 = medfilt2(%image with salt and pepper noise%, [7,7]);
% removes salt & pepper noise 2D filter %
figure, imagesc(OUTM1), colormap gray, title('median filter 7x7 matrix')
figure, surf(OUTM1), imhist(uint8(OUTM1), 256), title(' med. 7x7 filter')