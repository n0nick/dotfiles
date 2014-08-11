# n0nick's dotfiles

## What it does

* Installs [my Prezto fork](https://github.com/n0nick/prezto) and sets it up.
* Adds custom configurations for Git, Tmux, Slate, Karabiner and other misc
  tools.
* Installs a set of Vim plugins (via [Vundle.vim]) and configuration scripts.

## Who's it for

Oh, this one's for me.
I'm using these customizations on my Mac machines for work, which is mostly Web
development and some academic study.

## Prerequisites

1. [OS X]

2. [Homebrew] and [homebrew-cask](https://github.com/caskroom/homebrew-cask)

        $ ruby -e "$(curl -fsSL \
            https://raw.github.com/Homebrew/homebrew/go/install)"
        $ brew install caskroom/cask/brew-cask

2. [iTerm2]

        $ brew cask install iterm2

3. [Zsh]

        $ brew install zsh
        $ chsh -s $(which zsh)

4. [Vim] for text editing

        $ brew install macvim

5. [Tmux] for managing sessions

        $ brew install tmux

6. [Git] for source control

        $ brew install git

7. [Slate] for window management

        $ cd /Applications && curl \
        http://www.ninjamonkeysoftware.com/slate/versions/slate-latest.tar.gz |
        tar -xz

8. [Karabiner] and [Seil] for keyboard customization

## Installation

        $ git clone https://github.com/n0nick/dotfiles
        $ cd dotfiles
        $ ./install.sh
## License

[Do what the hell you
want.](https://github.com/n0nick/dotfiles/blob/master/COPYING)

[OS X]: http://www.apple.com/mac/
[Homebrew]: http://brew.sh/
[Zsh]: http://www.zsh.org/
[Prezto]: https://github.com/sorin-ionescu/prezto
[Vim]: http://vim.org
[Vundle.vim]: http://github.com/gmarik/vundle
[Tmux]: http://tmux.sourceforge.net/
[Karabiner]: https://pqrs.org/osx/karabiner/
[Seil]: https://pqrs.org/osx/karabiner/seil.html.en
[Slate]: https://github.com/jigish/slate
[iTerm2]: http://iterm2.com/
[Git]: http://git-scm.com/
