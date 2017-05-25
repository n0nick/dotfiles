# n0nick's dotfiles

## What it does

* Installs [Prezto] and sets it up.
* Adds custom configurations for Zsh, Prezto, Git, Tmux, and other misc tools.
* Installs a set of Vim plugins (via [vim-plug]) and configuration scripts.

## Who's it for

Oh, this one's for [me](https://github.com/n0nick).
I'm using these customizations on my work laptop and workstation (A Macbook and
a Linux workstation), mostly for Web development, with a side of general code
and academic playground.

## Prerequisites

1. [Zsh] for shell power
2. [Vim] for text editing and general win
3. [Tmux] for terminal session management
4. [Git] for source control

## OS X bootstrap

1. [Homebrew] and [homebrew-cask](https://github.com/caskroom/homebrew-cask)

        $ /usr/bin/ruby -e "$(curl -fsSL \
          https://raw.githubusercontent.com/Homebrew/install/master/install)"
        $ brew tap caskroom/cask

2. [iTerm2]

        $ brew cask install iterm2

3. Zsh

        $ brew install zsh
        $ chsh -s $(which zsh)

4. Vim

        $ brew install vim

5. Tmux

        $ brew install tmux

6. Git

        $ brew install git

## Linux bootstrap

1. [Nix]

        $ curl https://nixos.org/nix/install | sh

2. Zsh

        $ chsh -s $(which zsh)

3. Neovim

        $ nx-env -i neovim

4. Tmux

        $ nx-env -i tmux

## Installation

        $ git clone https://github.com/n0nick/dotfiles
        $ cd dotfiles
        $ ./install.sh

## License

[Do what the hell you
want.](https://github.com/n0nick/dotfiles/blob/master/COPYING)

[Homebrew]: http://brew.sh/
[Zsh]: http://www.zsh.org/
[Prezto]: https://github.com/sorin-ionescu/prezto
[Vim]: http://vim.org
[vim-plug]: https://github.com/junegunn/vim-plug
[Tmux]: http://tmux.sourceforge.net/
[iTerm2]: http://iterm2.com/
[Git]: http://git-scm.com/
[Nix]: https://nixos.org/nix/
