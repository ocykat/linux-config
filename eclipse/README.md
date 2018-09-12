## Install Eclipse

First, download the `.tar.gz` file.

Then, run these commands:

```
sudo tar xf eclipse.tar.gz -C /opt/
cd /opt/eclipse
./eclipse
```


## Create Launcher

```
sudo vim /usr/share/applications/eclipse-neon.desktop
```

Paste the following into the file:

```
[Desktop Entry]
Name=Eclipse Neon
Comment=Eclipse Neon IDE
Type=Application
Encoding=UTF-8
Exec=/opt/eclipse/eclipse
Icon=/opt/eclipse/icon.xpm
Categories=GNOME;Application;Development;
Terminal=false
StartupNotify=true
```
