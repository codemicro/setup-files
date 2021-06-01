# ADB and Fastboot

2021-05-30

ADB and Fastboot are tools for installing custom ROMs on Android devices.

1. Download package from https://dl.google.com/android/repository/platform-tools-latest-linux.zip
2. Extract to `~/adb-fastboot`
3. Add the following to `~/.bashrc`
   ```bash
   if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
      export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
   fi
   ```
4. `. ~/.bashrc`

## udev rules

Permissions issues may arise when using `fastboot`. This can be resolved by doing the following ([source](https://github.com/M0Rf30/android-udev-rules#installation)):

```bash
git clone https://github.com/M0Rf30/android-udev-rules.git
cd android-udev-rules
sudo cp -v 51-android.rules /etc/udev/rules.d/51-android.rules
sudo chmod a+r /etc/udev/rules.d/51-android.rules
sudo cp android-udev.conf /usr/lib/sysusers.d/
sudo systemd-sysusers
sudo gpasswd -a $(whoami) adbusers
sudo udevadm control --reload-rules
sudo systemctl restart systemd-udevd.service
adb kill-server
# Reconnect Android device, then run the following to test
adb devices
```
