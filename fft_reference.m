outFile_real = "references/fft/real_ref.txt";
outFile_imag = "references/fft/imag_ref.txt";

X = [0, 1, 2, 3, 4, 5, 6, 7];
X_fft = fft(X, 8);
X_fft_real = real(X_fft);
X_fft_imag = imag(X_fft);

realFile = fopen(outFile_real, "w");
imagFile = fopen(outFile_imag, "w");

for i = 1 : length(X_fft)
    fprintf(realFile, "%f\n", X_fft_real(i));
    fprintf(imagFile, "%f\n", X_fft_imag(i));
end

fclose(realFile);
fclose(imagFile);