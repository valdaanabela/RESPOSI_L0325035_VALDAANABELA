% L0325035_ValdaAnabela

WM = 'L0325035_ValdaAnabela';

% 1. Inisialisasi Parameter
h0 = 5;
lambda = 12;
v = 36;
x = 10;
t = linspace(0, 5, 500); % Rentang t dari 0 hingga 5

% 2. Perhitungan Nilai Eksak
theta = (t * v) / lambda; % theta = 3*t
h_eksak = h0 * (cos(theta) + exp(x));

% 3. Perhitungan Pendekatan Deret Taylor (n = 23, 24, 25)
n_vals = [23, 24, 25];
h_approx = zeros(length(n_vals), length(t));

for idx = 1:length(n_vals)
    n = n_vals(idx);

    % Pendekatan cos(theta) dengan n suku
    cos_approx = zeros(size(t));
    for k = 0:(n-1)
        cos_approx = cos_approx + ((-1)^k * (theta).^(2*k)) / factorial(2*k);
    end

    % Pendekatan exp(x) dengan n suku
    exp_approx = 0;
    for k = 0:(n-1)
        exp_approx = exp_approx + (x^k) / factorial(k);
    end

    h_approx(idx, :) = h0 * (cos_approx + exp_approx);
end

% 4. Visualisasi Grafik
figure;
plot(t, h_eksak, 'k-', 'LineWidth', 2, 'DisplayName', 'Eksak'); hold on;
plot(t, h_approx(1,:), 'r--', 'LineWidth', 1.5, 'DisplayName', 'n = 23');
plot(t, h_approx(2,:), 'g-.', 'LineWidth', 1.5, 'DisplayName', 'n = 24');
plot(t, h_approx(3,:), 'b:', 'LineWidth', 1.5, 'DisplayName', 'n = 25');
xlabel('Waktu (t)');
ylabel('Ketinggian Gelombang (h)');
title({'Perbandingan Perhitungan Eksak vs Pendekatan Deret Taylor', ['[ ' WM ' ]']});
legend('Location', 'northeast');
grid on;

text(0.02, 0.05, WM, 'Units', 'normalized', 'FontSize', 12, ...
     'Color', [0.5 0.5 0.5], 'FontWeight', 'bold');

% 5. Analisis Galat Mutlak dan Galat Relatif (%)
fprintf('   HASIL ANALISIS KASUS 1 - %s   \n', WM);
for idx = 1:length(n_vals)
    galat_mutlak = abs(h_eksak - h_approx(idx, :));
    galat_relatif = mean(galat_mutlak ./ h_eksak) * 100;
    fprintf('Rerata Galat Mutlak (n=%d)  : %.6f\n', n_vals(idx), mean(galat_mutlak));
    fprintf('Rerata Galat Relatif (n=%d) : %.8f %%\n', n_vals(idx), galat_relatif);
end
