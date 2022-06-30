IN = imread('image path');
IN=double(IN);
OUTF = fftshift(fft2(IN));
OUTF = log(abs(OUTF));
figure, imagesc(OUTF), colormap gray, title('magnitude(log) of input image')

%  low-pass Gaussian filter %
P = rand(101,101); %random 101x101 matrix as spatial matrix%
F = (fft2(P));
G = fftshift(F);
[Q,W] = size(F);
SIGMA = 5;
X = 1:W-1;
Y = 1:Q-1;

Cx=0.5*W;
Cy=0.5*Q;
OUTGF =exp(-((X-Cx).^2+(Y-Cy).^2)./(2*SIGMA)^2);
figure, imagesc(OUTGF), colormap gray, title ('Gaussian low pass fft with 101x101 spatial and 5 sigma')
% transformed sharpening filter %

T = zeros(101, 101);
for i=1:7
    for j=1:7
        A(i+47, j+47) = E(i,j); %making the filter same as the 7x7 filter%
    end
end

R = fftshift(fft2(T)); % applying fft in A filter.%
OUTT = log(abs(R));
OUTF1 = conv2(IN,T);
figure, imagesc(OUTT), colormap gray, title ('Magnitude of the fourier transformed sharpening filter') 
figure, imagesc(OUTF1),colormap gray, title ('Magnitude of the transformed sharpening filter') % convoluting filter T with IN image%

