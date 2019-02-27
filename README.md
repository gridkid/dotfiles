# Dotfiles (gridkid)

My OS X dotfiles. For now a very basic collection for Z shell and Vim.


## Software dependencies

### iTerm2 (recommended)
[iTerm 2](https://www.iterm2.com/downloads.html) a recommended replacement for OS X’s default Terminal 

> NOTE: For use of a [Base16 theme](https://github.com/chriskempson/base16) with "256" colorspace support, the [Base16 Shell](https://github.com/chriskempson/base16-shell) script must be installed.

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

brew tap caskroom/cask

brew doctor
brew update; brew cleanup; brew cask cleanup
```

### Git

```bash
brew install git
```

### fzf - A command-line fuzzy finder

```bash
brew install fzf

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
```

### tmux - terminal multiplexer
```bash
brew install tmux
```

### Vim with if\_lua

```bash
brew install vim --with-lua --with-override-system-vim
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

Step 4.) Install vim-plug - Vim plugin manager

Currently there is **no need** to install vim-plug with the command below. The installation will be checked at the start of VIM and if necessary executed.
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
> 
> NOTE: A list of all used Vim Plugins see the ".vimrc" file. 
> Install with ```:PlugInstall``` and check the status with ```:PlugStatus```


## Final settings

### Git Committer Information
Create a '.gitconfig.user' file in the home directory with git credentials such as:
```
[user]
  name = Your Name
  email = youremail@domain.com

[credential]
  helper = osxkeychain
```


## ToDo
* Install Script (Automate all of these things e.g. install software dependencies, symlink dotfiles)
* Sensible OS X defaults


## Special thanks to…

[Steffen Rademacker](https://webgefrickel.de) and his [dotfiles repository](https://github.com/webgefrickel/dotfiles/).

Many thanks also to the [GitHub dotfiles community](http://dotfiles.github.io/) and all the authors of the incredibly useful tools.
