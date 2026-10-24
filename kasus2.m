% L0325035_ValdaAnabela

WM = 'L0325035_ValdaAnabela';

% 1. Matriks Koefisien A (dalam kg) dan Vektor B (dalam Rupiah)
A = [2.5,  1.5,  5.0, 0.5;
     4.0,  0.75, 1.0, 2.0;
     2.0,  1.5,  0.5, 6.0;
     1.0,  4.25, 2.0, 0.9];

B = [161000; 149000; 251500; 173000];

% 2. Uji Syarat Konvergensi Gauss-Seidel (Diagonal Dominance)
is_diagonally_dominant = true;
n = size(A, 1);

for i = 1:n
    sum_off_diag = sum(abs(A(i, :))) - abs(A(i, i));
    if abs(A(i, i)) <= sum_off_diag
        is_diagonally_dominant = false;
    end
end

fprintf('   UJI KELAYAKAN GAUSS-SEIDEL - %s   \n', WM);
if is_diagonally_dominant
    fprintf('Matriks memenuhi syarat Strictly Diagonal Dominant.\n');
else
    fprintf('Matriks TIDAK memenuhi syarat Strictly Diagonal Dominant.\n');
    fprintf('Metode Gauss-Seidel tidak layak digunakan karena berpotensi terdivergensi.\n');
end

% 3. Penyelesaian dengan Metode Langsung (Eliminasi Gauss-Jordan)
Aug = [A B];
for i = 1:n
    % Normalisasi baris pivot
    Aug(i, :) = Aug(i, :) / Aug(i, i);

    % Eliminasi elemen kolom selain pivot
    for j = 1:n
        if j ~= i
            factor = Aug(j, i);
            Aug(j, :) = Aug(j, :) - factor * Aug(i, :);
        end
    end
end

X = Aug(:, end);

% 4. Output Hasil
fprintf('   HASIL HARGA BAHAN MAKANAN - %s   \n', WM);
fprintf('Harga Beras  (x1) : Rp %.2f / kg\n', X(1));
fprintf('Harga Telur  (x2) : Rp %.2f / kg\n', X(2));
fprintf('Harga Tepung (x3) : Rp %.2f / kg\n', X(3));
fprintf('Harga Ayam   (x4) : Rp %.2f / kg\n', X(4));
