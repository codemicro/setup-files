# WiFi card

2021-05-02

Disabled power save mode

1. `sudo nano /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf`
2. Edit file to replace `wifi.powersave = 3` with `wifi.powersave = 2`
