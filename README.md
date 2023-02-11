# Internet Reachability Checker

This script sends a ping request to several well-known IP addresses of DNS providers. If none of them are reachable within 15 minutes the script will reboot the server.

## Installation

You can run this script in the background on a modern Ubuntu distro with the following steps:

```
sudo cp check_internet.sh /usr/local/bin/
sudo chmod 755 /usr/local/bin/check_internet.sh
sudo cp check_internet.service /etc/systemd/system/ 
sudo systemctl daemon-reload
sudo systemctl enable check_internet.service
sudo systemctl start check_internet.service
sudo systemctl status check_internet.service
```

Your mileage may vary on other distributions.

## License

Donated to the public domain by D.R. Vink
