# dotfiles

## Cross-platform terminal stack

### zsh
> The Z shell (Zsh) is a Unix shell that can be used as an interactive login shell and as a command interpreter for shell scripting.

* https://en.wikipedia.org/wiki/Z_shell

Ubuntu/WSL
```shell
sudo apt install zsh
```

```shell
which zsh
```

```shell
chsh -s $(which zsh)
```

### alacritty
> A cross-platform, OpenGL terminal emulator.

* https://alacritty.org/
* https://github.com/alacritty/alacritty
* https://github.com/alacritty/alacritty/blob/master/INSTALL.md
* https://alacritty.org/config-alacritty.html

Ubuntu
```shell
sudo snap install alacritty --classic
```
Windows
* https://github.com/alacritty/alacritty/releases


### Zellij
> A terminal workspace with batteries included.

* https://zellij.dev/
* https://github.com/zellij-org/zellij

Ubuntu/WSL
```shell
cd ~/Downloads
wget https://github.com/zellij-org/zellij/releases/download/v0.43.1/zellij-x86_64-unknown-linux-musl.tar.gz
tar -xvf zellij-x86_64-unknown-linux-musl.tar.gz
sudo mv zellij /usr/local/bin/
rm zellij-x86_64-unknown-linux-musl.tar.gz
```

