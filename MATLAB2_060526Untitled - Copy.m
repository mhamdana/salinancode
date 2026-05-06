citra = imread('lena.bmp');
% Jika gambar berwarna, ubah ke grayscale dulu agar perhitungan matriksnya simpel
if size(citra, 3) == 3
    citra = rgb2gray(citra);
end

[t, l] = size(citra); % t = tinggi (baris), l = lebar (kolom)

% --- CITRA ASLI ---
subplot(2,2,1);
imshow(citra);
title('Original Image');

% --- CITRA NEGATIF ---
subplot(2,2,2);
negatif_cit = 255 - citra; % Di MATLAB bisa langsung begini (tanpa loop)
imshow(negatif_cit);
title('Citra Negatif');

% --- TRANSFORMASI LOGARITMA ---
subplot(2,2,3);
log_cit = uint8(zeros(t, l)); % Siapkan wadah kosong
for i = 1:t
    for j = 1:l
        % Rumus: s = c * log(1 + r). Angka 255/log10(256) adalah konstanta c
        trans_log = (255 / log10(256)) * log10(1 + double(citra(i,j)));
        log_cit(i,j) = uint8(trans_log);
    end
end
imshow(log_cit);
title('Transformasi Logaritma');

% --- GAMMA CORRECTION ---
subplot(2,2,4);
gamma_cit = uint8(zeros(t, l));
gamma = 0.5; % Contoh nilai gamma
for i = 1:t
    for j = 1:l
        % Rumus: s = c * r^gamma
        % r harus dinormalisasi ke 0-1 dulu
        r = double(citra(i,j)) / 255;
        trans_gamma = 255 * (r ^ gamma);
        gamma_cit(i,j) = uint8(trans_gamma);
    end
end
imshow(gamma_cit);
title('Gamma Correction');