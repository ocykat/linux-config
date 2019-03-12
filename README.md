This repository stores the configurations for my Debian machine.


*Last update: August 20, 2018*


## System Info

* **OS**: Debian Linux 9.5 (Stretch)
* **DE**: xfce


## Setup `sudo`

To avoid having to setup `sudo`, simply **do not specify a root password while installing.**

To enable `sudo`, follow these steps in the terminal:

```
su
# insert your root password when prompted
apt get install sudo
adduser <username> sudo
```


## Install Applications

Before installing applications with `apt`, it is a good idea to run the
following commands:

```
sudo apt update
sudo apt upgrade
```

* **`checkinstall`**

```
sudo apt install checkinstall
```

* **`cmake`**

```
sudo apt install cmake
```

* **`curl`**

```
sudo apt install curl
```


* **`ibus-unikey`**

```
sudo apt install ibus-unikey
```


* **`intel-microcode`**

```
sudo apt install intel-microcode
```


* **`geany`**

```
sudo apt install geany
```


* **`git`**

```
sudo apt install git
```


* **`guake`**

```
sudo apt install guake
```


* **`intellij`**
Check the intellij directory.


* **`java jdk`**

[Full instruction](https://wiki.debian.org/JavaPackage)


* **`nodejs`**

[Instruction](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)


* **`qpdfview`**

```
sudo apt install qpdfview
```


* **`tex`**

```
sudo apt install texlive-full
```


* **`tlp`**

```
sudo apt install tlp tlp-rdw
```


* **`tmux`**

```
sudo apt install tmux
```


* **`vim`**

The best way to obtain `vim` is to build it from source, following
[this](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source)
instruction.


* **`zathura`**
```
sudo apt install zathura
```


* **`zsh`**

```
sudo apt install zsh
```

To install `oh-my-zsh`, follow this [link](https://github.com/robbyrussell/oh-my-zsh).


## Prevent packages from auto-upgrade

To prevent a package from auto-upgrade:
```
sudo apt-mark hold package_name
```

To check which packages are being hold:
```
sudo dpkg --get-selections | grep "hold"
# or
sudo apt-mark showhold
```

To re-enable auto-upgrade:
```
sudo apt-mark unhold package_name
```
