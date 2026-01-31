% === Settings ===
fs = 16000;
N  = 2048;
dt = N/fs;

rec = audioDeviceReader('SampleRate', fs, 'SamplesPerFrame', N);

% === Initial Window Selection ===
fprintf("Select window function:\n");
fprintf("1: Rectangular\n");
fprintf("2: Hamming\n");
fprintf("3: Hann\n");
fprintf("4: Blackman\n");
opt = input("Enter choice (1-4): ");

[win, winName] = windowSelect(N,opt);

% === Plot Setup ===
Twindow = 10;
Nwin = round(Twindow/dt);
pitchHist = nan(1,Nwin);
tHist = linspace(-Twindow,0,Nwin);

fig = figure;
h = plot(tHist, pitchHist, 'LineWidth', 1.5);
ylim([0 700]);
xlabel("Time (s)");
ylabel("Pitch (Hz)");
title("Real-time Pitch (Window: " + winName + ")");
grid on;
drawnow;

% Setup key handler for switching
set(fig,'KeyPressFcn',@keyHandler);

disp("Listening... (press 'w' to switch window, 'q' to quit)");

% === Real-Time Loop ===
while ishandle(fig)
    frame = rec();

    % Pitch detection
    [pitchHz, peakVal] = detectPitch(frame, fs, N, win);

    % Voicing check
    if VoiceChk(frame, pitchHz, peakVal)
        p = pitchHz;
    else
        p = nan;
    end

    % Update rolling history
    pitchHist = [pitchHist(2:end) p];
    set(h,'YData',pitchHist);
    drawnow limitrate;

    % === Hotkey Check ===
    if evalin('base','exist(''lastKey'',''var'')')
        key = evalin('base','lastKey');
        evalin('base','clear lastKey');

        if strcmpi(key,'w')
            fprintf("\nSwitching window...\n");
            fprintf("1: Rectangular\n");
            fprintf("2: Hamming\n");
            fprintf("3: Hann\n");
            fprintf("4: Blackman\n");
            opt = input("Enter choice (1-4): ");
            [win, winName] = windowSelect(N,opt);
            title("Real-time Pitch (Window: " + winName + ")");
            drawnow;
        elseif strcmpi(key,'q')
            disp("Exiting...");
            break;
        end
    end
end