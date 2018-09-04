## Install IntelliJ

First, download the `.tar.gz` file from the official website.

Usually, IntelliJ should be placed in the `/opt/` directory. This is where
third-party applications are installed by default in Linux, preventing interference
with the system files.

To install IntelliJ, run these commands:

```
sudo tar xf ideaIC-<version>.tar.gz
cd /opt/idea-IC-<...>/bin
./idea.sh
```


## Update IntelliJ

To allow IntelliJ to update properly, change the privilege of the intelliJ directory
from root to current user.

```
sudo chown -R $USER:$USER /opt/idea-IC-<...>
```
