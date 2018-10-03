# Install neovim

Best way to install neovim on Debian is building from source - installing
with `apt` would result in an old version of neovim (0.1.7) that is not
compatible with deoplete.

Follow the tutorial on the official repository. The following list of
commands will not certainly work.

```
git checkout v0.3.1 # as long as it is the lastest stable release
rm -r build
make clean
make CMAKE_BUILD_TYPE=Release
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/neovim"
make install
# export PATH="$HOME/neovim/bin:$PATH" => this can be done in the .zshrc
```



# Install python support

## Install `pyenv`

Visit the github repositories of `pyenv` and `pyenv-virtualenv` for info.


## Create virtual environments and install neovim packages

```
pyenv install 2.7.14
pyenv install 3.6.5

pyenv virtualenv 2.7.14 neovim2
pyenv virtualenv 3.6.5 neovim3

pyenv activate neovim2
pip install neovim
pyenv which python  # Note the path
pyenv deactivate

pyenv activate neovim3
pip install neovim
pyenv which python  # Note the path
pyenv deactivate
```


## Add python path to `init.vim`

```
let g:python_host_prog = '/home/nhat/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/home/nhat/.pyenv/versions/neovim3/bin/python'
```
