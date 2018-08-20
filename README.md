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


## Installing Applications

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
sudo apt install checkinstall
```


* **`ibus-unikey`**

```
sudo apt install ibus-unikey
```


* **`intel-microcode`**
```
sudo apt install intel-microcode
```


* **`git`**

```
sudo apt install git
```


* **`guake`**

```
sudo apt install guake
```


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


* **`zsh`**

```
sudo apt install zsh
```

To install `oh-my-zsh`, follow this [link](https://github.com/robbyrussell/oh-my-zsh).
