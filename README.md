# dotfiles

## Cross-platform terminal stack

### Hack Nerd Font
> Iconic font aggregator, collection, and patcher

* https://www.nerdfonts.com/

Windows
* Download Hack.zip from the [Nerd Fonts releases page](https://github.com/ryanoasis/nerd-fonts/releases)
* Extract the .ttf files.
* Select them all, right-click → Install for all users.

Ubuntu/WSL
```shell
cd ~/Downloads
wget -qO hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip
mkdir -p ~/.local/share/fonts
unzip hack.zip -d ~/.local/share/fonts
fc-cache -fv
rm hack.zip
```

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

```shell
rm -f ~/.zcompdump
```

### zsh extensions
* https://github.com/zdharma-continuum/zinit
```shell
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
```

### homebrew
> The missing package manager for macOS (or Linux)
* https://brew.sh/
* https://docs.brew.sh/Shell-Completion

```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```


### modern CLI tools

#### fzf
> 

* https://github.com/junegunn/fzf

```shell
brew install fzf
```

#### fd
> fzf is a general-purpose command-line fuzzy finder.

* https://github.com/sharkdp/fd

```shell
brew install fd
```

#### jq
> Command-line JSON processor

* https://jqlang.org/
* https://github.com/jqlang/jq

```shell
brew install jq
```

#### ripgrep/rg
> ripgrep recursively searches directories for a regex pattern while respecting your gitignore

* https://github.com/BurntSushi/ripgrep

```shell
brew install ripgrep
```

#### zoxide
> A smarter cd command. Supports all major shells.

* https://github.com/ajeetdsouza/zoxide

```shell
brew install zoxide
```

#### resvg
> An SVG rendering library.

* https://github.com/linebender/resvg

```shell
brew install resvg
```

#### poppler
> Poppler is a PDF rendering library based on the xpdf-3.0 code base. 

* https://poppler.freedesktop.org/

```shell
brew install poppler
```

#### 7-zip
> is a file archiver with a high compression ratio.

* https://www.7-zip.org/

```shell
sudo apt install 7zip
```

#### bat
* A cat(1) clone with wings. 

* https://github.com/sharkdp/bat

```shell
brew install bat
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


### zellij
> A terminal workspace with batteries included.

* https://zellij.dev/
* https://github.com/zellij-org/zellij

Ubuntu/WSL
```shell
cd ~/Downloads
wget -qO zellij.tar.gz https://github.com/zellij-org/zellij/releases/download/v0.43.1/zellij-x86_64-unknown-linux-musl.tar.gz
tar -xvf zellij.tar.gz
sudo mv zellij /usr/local/bin/
rm zellij.tar.gz
```

### yazi
> Blazing fast terminal file manager written in Rust, based on async I/O.

* https://yazi-rs.github.io/
* https://github.com/sxyazi/yazi

Ubuntu/WSL
```shell
cd ~/Downloads
wget -qO yazi.zip https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-gnu.zip
unzip -q yazi.zip -d yazi-temp
sudo mv yazi-temp/*/{yazi,ya} /usr/local/bin/
rm -rf yazi-temp yazi.zip
```

### starship
> The minimal, blazing-fast, and infinitely customizable prompt for any shell!

* https://starship.rs/
* https://github.com/starship/starship
* https://starship.rs/presets/nerd-font

Ubuntu/WSL
```shell
curl -sS https://starship.rs/install.sh | sh
```

```shell
starship preset nerd-font-symbols -o ~/.config/starship.toml
```

### neovim
> Vim-fork focused on extensibility and usability

* https://neovim.io/
* https://github.com/neovim/neovim

Ubuntu/WSL
```shell
sudo snap install nvim --classic
```

