clc
clear all
close all
% Persamaan Perbedaan
% y[n] - (5/6)*y[n-1] + (1/6)*y[n-2] = x[n]

% Solusi Numerik (Loop)
% y[n] = x[n] + (5/6)*y[n-1] - (1/6)*y[n-2]
% y[n] = 2 - (1/5).^n + (5/6)*y[n-1] - (1/6)*y[n-2]

n = [-20:20];
yn = zeros(1, 41); % kondisi awal sudah termasuk
% hitung untuk y >= 0, n = 0 di indeks 21
for k = 21:41
  yn(k) = 2 - (1/5).^(k-21) + (5/6)*yn(k-1) - (1/6)*yn(k-2);
end

% Solusi Numerik (function)
% n = [1:10];
% b = [1];
% a = [1 (-5/6) (1/6)];
% yi = [0 0];
% zi = filtic(b,a,yi);
% ynf = filter(b,a,2.^n,zi);
% 
% stem(n,ynf);


% Solusi Analitik
% y[n] = 6 - (1/5).^n - 11*(1/2).^n + 7*(1/3).^n
ya = zeros(1, 41);
% hitung untuk y >= 0, n = 0 di indeks 21
for k = 21:41
  ya(k) = 6 - (1/5).^(k-21) - 11*(1/2).^(k-21) + 7*(1/3).^(k-21);
end

figure; hold on;
stem(n,yn);
stem(n,ya);
hold off;