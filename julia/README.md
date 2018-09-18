## Install Julia

Download the `.tar.gz` file from the official website.

Install Julia to the `/opt/` directory.

```
sudo tar xf julia-1.0.0.tar.gz -C /opt/
```


## Add Julia to path by creating symlink

```
cd /opt/julia-1.0.0/bin
sudo ln -s julia /usr/local/bin/julia
```
