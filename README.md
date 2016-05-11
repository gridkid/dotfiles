# Dotfiles (gridkid)

My OS X dotfiles. For now a very basic collection for Z shell and Vim.


## Software dependencies

### iTerm2 (recommended)
[iTerm 2](https://www.iterm2.com/downloads.html) a recommended replacement for OS X’s default Terminal 

### Command Line Tools

```bash
xcode-select --install
```

### OhMyZSH

[Oh-My-Zsh](http://ohmyz.sh) a ZSH framework with many helpful functions, plugins and themes.

```bash
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

### Homebrew & Homebrew Cask

[Homebrew](http://brew.sh) Package manager for OS X

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install caskroom/cask/brew-cask

brew doctor
brew update
```

### Git

```bash
brew install git

git config --global user.name "Your Name"
git config --global user.email "youremail@domain.com"
```

### Vim with if\_lua

```bash
brew install vim --with-lua --with-override-system-vim
```

#### Vundle - Vim plugin manager
```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

> NOTE: A list of all used Vim Plugins see the ".vimrc" file. 
> Install with ```:PluginInstall``

### tmux - terminal multiplexer
```bash
brew install tmux
```

### More
... also useful [Ruby](https://www.ruby-lang.org/) and [Node](https://nodejs.org)


## Installation

Step 1.) Clone the repository

```bash
git clone https://github.com/gridkid/dotfiles ~/.dotfiles
```

Step 2.) Clone all submodules
```bash
cd ~/.dotfiles
git submodule init
git submodule update
```

Step 3.) Symlink all dotfiles
```bash
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/zsh/pure/pure.zsh ~/.oh-my-zsh/custom/pure.zsh-theme
ln -s ~/.dotfiles/zsh/pure/async.zsh ~/.oh-my-zsh/custom/async.zsh
ln -s ~/.dotfiles/zsh/zsh-syntax-highlighting/ ~/.oh-my-zsh/custom/plugins

ln -s ~/.dotfiles/.editorconfig ~/.editorconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.gitignore ~/.gitignore
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
```


## ToDo
* Install Script (Automate all of these things e.g. install software dependencies, symlink dotfiles)
* Sensible OS X defaults


## Special thanks to…

[Steffen Rademacker](https://webgefrickel.de) and his [dotfiles repository](https://github.com/webgefrickel/dotfiles/).

Many thanks also to the [GitHub dotfiles community](http://dotfiles.github.io/) and all the authors of the incredibly useful tools.
