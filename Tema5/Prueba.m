syms w 
X = 1 / (1 + 1j * w); 
w_values = 0:100;
X_values = double(subs(X, w, w_values));
figure, plot(w_values, abs(X_values)), title('Amplitude plot'), xlabel('Frequency'), ylabel('Amplitude') 
figure, plot(w_values, angle(X_values)), title('Phase plot'), xlabel('Frequency'), ylabel('Phase')