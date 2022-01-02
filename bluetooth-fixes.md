As per: https://gist.github.com/andrebrait/961cefe730f4a2c41f57911e6195e444

    Edit the file /etc/bluetooth/main.conf
    Uncomment FastConnectable config and set it to true: FastConnectable = true
    Uncomment ReconnectAttempts=7 (set the value to whatever number that you want)
    Uncomment ReconnectIntervals=1, 2, 3
