function voiced = VoiceChk(x, pitchHz, peakVal)

% === Parameters (tune lightly) ===
E_th  = 1e-4;     % energy threshold
Z_th  = 0.15;      
P_th  = 0.01;      

E = sum(x.^2);

zc = sum(abs(diff(sign(x)))) / (2*length(x));  % normalized

voiced = (E > E_th) && (zc < Z_th) && (peakVal > P_th) && (pitchHz > 50);
end
