# AudioPitchDetection
## Overview

This project implements a real-time voice pitch detection system using MATLAB and Simulink. Live audio is captured from a microphone, processed frame-by-frame, transformed into the frequency domain using FFT, and used to estimate the fundamental frequency (pitch).
The system also incorporates voicing detection to suppress unvoiced segments and provides real-time visualization of pitch variation. An interactive feature allows switching between different window functions during execution for comparative analysis.

## Features

Real-time microphone input processing

FFT-based pitch estimation

Voicing detection using energy, zero-crossing rate, and spectral peak strength

Live pitch visualization (time vs frequency)

User-selectable window functions

Mid-run window switching using keyboard hotkeys

## Tools and Requirements

MATLAB 2024b (or compatible version)

Audio Toolbox

DSP System Toolbox

Simulink

## Methodology Summary

Audio is captured from the system microphone at a fixed sampling rate.

The signal is divided into frames of fixed length.

A window function is applied to each frame to reduce spectral leakage.

FFT is computed and the magnitude spectrum is obtained.

The dominant spectral peak within the speech pitch range (50–500 Hz) is identified.

Voicing detection determines whether the frame contains voiced speech.

The detected pitch is displayed and plotted in real time.

## Supported Window Functions

Rectangular

Hamming

Hann

Blackman

## Keyboard Controls

w : Switch window function during runtime

q : Quit execution

The currently active window function is displayed live on the pitch plot.

## Project Structure
- main.m              # Real-time driver script
- detectPitch.m       # FFT-based pitch estimation
- VoiceChk.m          # Voicing detection logic
- windowSelect.m      # Window selection utility
- keyHandler.m        # Keyboard input handler
- simulink_model.slx  # Simulink implementation
- README.md

## How to Run

Clone the repository or download the project files.

Open MATLAB and ensure required toolboxes are installed.

Add the project folder to the MATLAB path.

Run the main script:

main


Select a window function when prompted.

Speak, hum, or sing into the microphone.

Use hotkeys to switch windows or exit.

## Results

Stable real-time pitch tracking for voiced speech and singing input

Effective suppression of unvoiced and silent regions

Hamming and Hann windows provide the most stable pitch estimates

Rectangular window shows higher jitter due to spectral leakage

## Limitations

FFT peak-based pitch detection may exhibit octave errors

Performance depends on microphone quality and ambient noise

Thresholds are empirically chosen and may require tuning for different environments

## Future Work

Autocorrelation or YIN-based pitch detection

Adaptive thresholding for voicing detection

Pitch smoothing and octave error correction

Spectrogram with pitch overlay

Speaker characterization and analysis

## Author

Manav Verma
RV College of Engineering
add references or citations

rewrite it in a more research-paper style
