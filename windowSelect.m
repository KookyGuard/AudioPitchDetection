function [win, name] = windowSelect(N,opt)

switch opt
    case 1
        win = ones(N,1);
        name = "Rectangular";
    case 2
        win = hamming(N);
        name = "Hamming";
    case 3
        win = hann(N);
        name = "Hann";
    case 4
        win = blackman(N);
        name = "Blackman";
    otherwise
        win = hamming(N);
        name = "Hamming (default)";
end
end