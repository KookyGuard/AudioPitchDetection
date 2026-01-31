function [pitchHz, peakVal] = detectPitch(x, fs, N, win)
    fmin = 50; 
    fmax = 600;
    
    xw = x .* win;
    X  = fft(xw);
    mag = abs(X);
    
    halfN = N/2;
    spec = mag(1:halfN);
    
    kmin = ceil(fmin*N/fs);
    kmax = floor(fmax*N/fs);
    
    [peakVal, idx] = max(spec(kmin:kmax));
    k = kmin + idx - 1;
    
    pitchHz = (k * fs) / N;
end