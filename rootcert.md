# Installing root certificates

2021-05-04

```bash
sudo mkdir /usr/share/ca-certificates/extra
sudo mv foo.crt /usr/share/ca-certificates/
sudo dpkg-reconfigure ca-certificates
```
