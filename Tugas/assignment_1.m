clc
clear all
close all

% Persamaan Perbedaan
% y[n] - (5/6)*y[n-1] + (1/6)*y[n-2] = x[n]
% x[n] = 2 - (1/5).^n
% y(-1) = y(-2) = 0

%% Solusi Numerik dengan Loop
% y[n] = 2 - (1/5).^n + (5/6)*y[n-1] - (1/6)*y[n-2], n>=0

n = [-20:20];       % meninjau y(n) pada -20<=n<=20
tic
ynl = zeros(1, 41); % mengisi pre-alokasi y(n), kondisi awal sudah termasuk

% menghitung y(n) untuk n>=0, n=0 ada di indeks MATLAB k=21
for k = 21:41
    % perpangkatan melihat nilai n, sehingga harus disesuaikan dimana n=k-21
    % sedangkan indeks hanya melihat elemen sebelumnya, sehingga tetap k-1
    ynl(k) = 2 - (1/5).^(k-21) + (5/6)*ynl(k-1) - (1/6)*ynl(k-2);
end
toc

% stem(n, ynl);

%% Solusi Numerik dengan Fungsi Bawaan 

% n = [-20:20];                               % meninjau y(n) pada -20<=n<=20
tic
b = [1];                                    % koefisien x
a = [1 (-5/6) (1/6)];                       % koefisien y
yi = [0 0];                                 % kondisi awal [y(-1) y(-2)]
tic
zi = filtic(b,a,yi);                        % kondisi awal untuk delay filter
toc
ynf = filter(b,a,2-(1/5).^(n(21:41)),zi);   % menghitung y(n) untuk n>=0, n=0 ada di indeks MATLAB k=21

ynf = [zeros(1,20) ynf];                    % menyamakan panjang array output dengan nol (sistem rileks)
toc

% stem(n,ynf);

%% Solusi Analitik
% y[n] = 6 - (1/5).^n - 11*(1/2).^n + 7*(1/3).^n, n>=0

% n = [-20:20];       % meninjau y(n) pada -20<=n<=20
tic
ya = zeros(1, 41);  % mengisi pre-alokasi y(n), kondisi awal sudah termasuk

% menghitung y(n) untuk n>=0, n=0 ada di indeks MATLAB k=21
for k = 21:41
    % perpangkatan melihat nilai n, sehingga harus disesuaikan dimana n=k-21
    ya(k) = 6 - (1/5).^(k-21) - 11*(1/2).^(k-21) + 7*(1/3).^(k-21);
end
toc

% stem(n,ya);

%% Grafik Solusi

figure; hold on;
subplot(2,1,1);
stem(n,ynf,'b');
title('Hasil Numerik');
ylabel('y(n)');
xlabel('n');
subplot(2,1,2);
stem(n,ya,'m');
title('Hasil Analitik');
ylabel('y(n)');
xlabel('n');
hold off;
