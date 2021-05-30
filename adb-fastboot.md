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

