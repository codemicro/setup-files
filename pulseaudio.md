# PulseAudio

2021-05-03

## Fix skipping/"catching up" during playback

(https://livingthelinuxlifestyle.wordpress.com/2019/06/09/solve-problems-with-no-sound-in-linux-mint/)

1. `sudo nano /etc/pulse/default.pa`
2. Find the line `load-module module-udev-detect`
3. Replace with `load-module module-udev-detect tsched=0`
4. `pulseaudio -k; pulseaudio --start`
