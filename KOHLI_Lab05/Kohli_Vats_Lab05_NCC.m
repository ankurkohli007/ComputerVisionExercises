%loading all images
I = double(rgb2gray(imread('ur_c_s_03a_01_L_0376.png','png')));
figure,imagesc(I)
I1 = double(rgb2gray(imread('ur_c_s_03a_01_L_0377.png','png')));
figure,imagesc(I1)
I2 = double(rgb2gray(imread('ur_c_s_03a_01_L_0378.png','png')));
figure,imagesc(I2)
I3 = double(rgb2gray(imread('ur_c_s_03a_01_L_0379.png','png')));
figure,imagesc(I3)
I4 = double(rgb2gray(imread('ur_c_s_03a_01_L_0380.png','png')));
figure,imagesc(I4)
I5 = double(rgb2gray(imread('ur_c_s_03a_01_L_0381.png','png')));
figure,imagesc(I5) 
%patching red car for all given 6 images
P = I(355:430,690:780); 
P1 = I1(355:427, 690:770);
P2 = I2(355:420, 690:770);
P3 = I3(355:420, 690:770);
P4 = I4(355:419, 687:768);
P5 = I5(352:419, 687:768);
%applying normalised cross correlation
y = normxcorr2(P,I);
figure,imagesc(y),colormap gray,title('NCC on image 1 for red car'), rectangle('position', [720, 355, 90, 140],'EdgeColor','r','LineWidth',1)
y1 = normxcorr2(P1,I);
figure,imagesc(y1), colormap gray,title('NCC on image 2 for red car'), rectangle('position', [720, 355, 90, 140],'EdgeColor','r','LineWidth',1)
y2 = normxcorr2(P2,I);
figure,imagesc(y2),colormap gray,title('NCC on image 3 for red car'), rectangle('position', [720, 355, 90, 140],'EdgeColor','r','LineWidth',1)
y3 = normxcorr2(P3,I);
figure,imagesc(y3),colormap gray,title('NCC on image 4 for red car'), rectangle('position', [720, 355, 90, 140],'EdgeColor','r','LineWidth',1)
y4 = normxcorr2(P4,I);
figure, imagesc(y4), colormap gray,title('NCC on image 5 for red car'), rectangle('position', [720, 355, 90, 140],'EdgeColor','r','LineWidth',1)
y5 = normxcorr2(P5,I);
figure, imagesc(y5), colormap gray,title('NCC on image 6 for red car'), rectangle('position', [720, 355, 90, 140],'EdgeColor','r','LineWidth',1)

%patching black car for all 6 images
B = I(360:410,550:650);
B1 = I(365:411, 550:640);
B2 = I(365:411, 545:637);
B3 = I(365:411,540:631);
figure,imagesc(B3),colormap gray,title('normal window')
B4 = I(370:401, 545:605);
figure,imagesc(B4),colormap gray,title('small window')
B5 = I(355:425, 510:620);
figure,imagesc(B5),colormap gray, title('large window')
%applying normalized cross correlation on black car
z = normxcorr2(B,I);
figure,imagesc(z), colormap gray, title('NCC on image 1 for black car'), rectangle('position', [580, 355, 90, 140],'EdgeColor','r','LineWidth',1)
z1 = normxcorr2(B1,I);
figure,imagesc(z1),colormap gray, title('NCC on image 2 for black car'), rectangle('position', [580, 355, 90, 140],'EdgeColor','r','LineWidth',1)
z2 = normxcorr2(B2,I);
figure, imagesc(z2), colormap gray, title('NCC on image 3 for black car'), rectangle('position', [580, 355, 90, 140],'EdgeColor','r','LineWidth',1)
z3 = normxcorr2(B3,I);
figure,imagesc(z3),colormap gray, title('NCC on normal window for black car'), rectangle('position', [580, 355, 90, 140],'EdgeColor','r','LineWidth',1)
z4 = normxcorr2(B4,I);
figure,imagesc(z4),colormap gray,title('NCC on small window for black car'), rectangle('position', [580, 355, 90, 140],'EdgeColor','r','LineWidth',1)
z5 = normxcorr2(B5,I);
figure,imagesc(z5),colormap gray,title('NCC on large window for black car'), rectangle('position', [580, 355, 90, 140],'EdgeColor','r','LineWidth',1)