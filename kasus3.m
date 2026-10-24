% L0325035_ValdaAnabela

WM = 'L0325035_ValdaAnabela';

% 1. Definisi Fungsi Non-Linear f(r)
f = @(r) (4/3) * pi * r.^3 - 300;

% 2. Penentuan Nilai Awal via Metode Grafik
r_range = 0:0.1:6;
figure;
plot(r_range, f(r_range), 'b-', 'LineWidth', 2); hold on;
yline(0, 'r--', 'LineWidth', 1.5);
xlabel('Jari-jari r (cm)');
ylabel('f(r)');
title({'Grafik Penentuan Akar Persamaan Non-Linear f(r) = 0', ['[ ' WM ' ]']});
grid on;

text(0.02, 0.05, WM, 'Units', 'normalized', 'FontSize', 12, ...
     'Color', [0.5 0.5 0.5], 'FontWeight', 'bold');

% 3. Penyelesaian Akar Persamaan dengan Metode Biseksi
a = 3;
b = 5;
tol = 1e-6;
max_iter = 100;

iter = 0;
c = a;
while (b - a) / 2 > tol && iter < max_iter
    iter = iter + 1;
    c = (a + b) / 2;

    if f(c) == 0
        break;
    elseif f(a) * f(c) < 0
        b = c;
    else
        a = c;
    end
end

r_sol = c;

% 4. Perhitungan Volume Tabung di Luar Bola
V_bola = 300;
V_tabung = pi * (r_sol^2) * (2 * r_sol); % h = 2r
V_luar = V_tabung - V_bola;

% 5. Output Hasil Perhitungan
fprintf('   HASIL PERHITUNGAN KASUS 3 - %s   \n', WM);
fprintf('Jari-jari bola/tabung (r) : %.4f cm\n', r_sol);
fprintf('Jumlah Iterasi Biseksi    : %d\n', iter);
fprintf('Volume Tabung             : %.4f cm^3\n', V_tabung);
fprintf('Volume Tabung di Luar Bola: %.4f cm^3\n', V_luar);
