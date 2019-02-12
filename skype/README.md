# Skype on Debian

* Step 1: Get Skype for Linux on the official website: [link](https://www.skype.com/en/get-skype/)
* Step 2: Install `alien`
```
sudo apt install alien
```
* Step 3: Either install the RPM file directly, or convert it to a Debian package and then install.
```
# Install directly
sudo alien -i <filename>.rpm

# Convert to Debian package
sudo alien <filename>.rpm
sudo dpkg -i <filename>.deb
```