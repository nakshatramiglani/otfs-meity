outFile_real = "references/fft/real_ref.txt";
outFile_imag = "references/fft/imag_ref.txt";

outFile = "data/fft/ref.json";

X = 0:511;

tic;
X_fft = fft(X, 512);
elapsedTime = toc;
disp(['Exeuction time: ', num2str(elapsedTime), ' seconds']);
X_fft_real = real(X_fft);
X_fft_imag = imag(X_fft);

realFile = fopen(outFile_real, "w");
imagFile = fopen(outFile_imag, "w");
data = fopen(file, "w");

s = struct();

for i = 1 : length(X_fft)
    op = [X_fft_real(i), X_fft_imag(i)];
    s.(sprintf('in_%d', X(i))) = op;
end

jsonString = jsonencode(s, PrettyPrint=true);
fprintf(data, "%s", jsonString);

for i = 1 : length(X_fft)
    fprintf(realFile, "%f\n", X_fft_real(i));
    fprintf(imagFile, "%f\n", X_fft_imag(i));
end

fclose(realFile);
fclose(imagFile);