%harris corner detector
img = double(imread('i235.png','png'));
figure,imagesc(img),colormap gray, title('Original image for haris detection')

%computing derivative along x
dx = [1 0 -1; 2 0 -2; 1 0 -1];%sobel edge detector gradient
Ix=conv2(img,dx,'same');
figure,imagesc(Ix),colormap gray, title('x-derivative of image')
%computing derivative along y
dy = [1 2 1; 0 0 0; -1 -2 -1];%sobel edge detector gradient
Iy= conv2(img,dy,'same');
figure,imagesc(Iy),colormap gray, title('y-derivative of image')
%product of derivatives
PIx= Ix.*Ix;
PIy= Iy.*Iy;
PIxy= Ix.*Iy;

%window (sum of product) of the above matrix using gaussian filt.
h = 6 %size of filter
sigma = 2 % standard deviation
W = fspecial('gaussian', h, sigma);
figure, imagesc(W), colormap gray, title('gaussian filter')
gx = conv2(PIx,W,'same');
gy = conv2(PIy,W,'same');
gxy= conv2(PIxy,W,'same');

%feature detection 
[rows,columns]=size(gy);
Corner= zeros(rows, columns);
R_map = zeros(rows, columns);
k = 0.05;

% detection of corner
for i= 1:rows
    for j= 1:columns
        M = [gx(i,j), gxy(i,j); gxy(i,j), gy(i,j)];
        R = det(M) - k*(trace(M).^2);
        map(i,j) = R;
        max_val = max(map(:));
        if R>0.3*max_val
            Corner(i,j)=1;
        else
            Corner(i,j)=0;
        end
    end
end

figure,imagesc(map),colormap gray,title('harris corner detection')


