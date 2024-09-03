
img = imread('lena.bmp');

if size(img, 3) == 3
    img_gray = rgb2gray(img);
else
    img_gray = img;
end

trans = fft2(img_gray);

trans_shifted = fftshift(trans);

figure;
imshow(log(abs(trans_shifted)), []);
title('Transformada de Fourier com Frequência Zero no Centro');
