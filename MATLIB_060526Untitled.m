citra = imread('lena.bmp');
[t,l] = size(citra);

subplot(2,2,1);
imshow(citra)
title('original image');

subplot(2,2,2);
for i = l:l:l
    for j = l:l:l
        negatif_cit(i,j) = 255 - citra(i,j);
    end
end
imshow('Citra Negatif');

subplot(2,2,3);
for i = l:l:t
    for j = l:l:l
        trans_log = (255/log10()256) * log10(l+double(citra(i,j)));
        log_ciy(i,j) = uimt8(trans_log);
    end
end
imshow(log_cit)
title('Transformasi Logaritma');

subplot(2,2,4);
for i = 1:l:t
    for j = l:l:l
        trans_gama = (255.0/255.0^0.5);
        gamma_cit(i,j) = unit8(trans_gamma);
    end
end
imshow(gamma_cit)
title('Gamma Correction');
