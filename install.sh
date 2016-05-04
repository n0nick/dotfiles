#!/bin/zsh

export DOTF="$( cd "$( dirname "$0" )" && pwd )"

export GREEN="\033[32m"
export YELLOW="\033[33m"
export BLUE="\033[34m"
export PURPLE="\033[35m"
export RESET="\033[0m"

main() {
  echo "${PURPLE}Let's do this!$RESET"
  install_prezto $*
  install_dotfiles $*
  install_vim $*
  install_neovim $*
  install_tmux $*
  setup_git $*
  echo -n "\n\n"
  echo "${GREEN}Yay! That's all!  ¯\_(ツ)_/¯$RESET"
}

run() {
  if [ $DEBUG ]; then
    echo "$ $*"
  else
    eval "$*"
  fi
}

symlink() {
  local source=$1
  local target=$2

  run "ln -snf" $source $target
}

symlink_dir() {
  dirname=$1

  run "ln -snF $DOTF/$dirname $HOME/.$dirname"
}

chapter() {
  echo "\n${BLUE}⇒ $1$RESET"
}

notice() {
  echo "\n${YELLOW}• $*"
}

greendot() {
  echo -n "${GREEN}.$RESET"
}

#### Steps
install_prezto() {
  chapter "Installing and configuring Prezto"

  preztodir="$HOME/.zprezto"
  if [ ! -d "$preztodir" ]; then
    run "git clone --recursive --quiet" \
      "git@github.com:sorin-ionescu/prezto.git" \
      "$preztodir"
    greendot
  else
    run "git -C \"$preztodir\" pull --quiet --recurse-submodules=yes"
    greendot
  fi

  for rcfile in "$preztodir"/runcoms/z*; do
    name="${rcfile:t}"
    [ "$name" = "zpreztorc" ] && continue;
    [ "$name" = "zprofile" ] && continue;
    [ "$name" = "zshrc" ] && continue;
    symlink "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    greendot
  done
}

install_dotfiles() {
  dirs=('zsh' 'ctags' 'git' 'ruby' 'shell' 'tmux')
  for dir in $dirs; do
    chapter "Linking ${(C)dir} configuration files"
    for file ($dir/*); do
      symlink "$DOTF/$file" "$HOME/.${file:t}"
      greendot
    done
  done
}

install_vim() {
  chapter "Installing Vim plugins and configuration"
  symlink_dir "vim"
  symlink "$DOTF/vim/vimrc" "$HOME/.vimrc"
  greendot
  # Install Vim plugins (via vim-plug)
  run "curl -fLo $DOTF/vim/autoload/plug.vim --create-dirs" \
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  greendot
  run "vim +PlugInstall +qall"
  greendot
}

install_neovim() {
  chapter "Installing Neovim plugins and configuration (experimental)"
  symlink "$DOTF/nvim" "$HOME/.config/nvim"
  greendot
  # Install Vim plugins (via vim-plug)
  run "curl -fLo $DOTF/nvim/autoload/plug.vim --create-dirs" \
        "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  greendot
  run "nvim +PlugInstall +qall"
  greendot
}

install_tmux() {
  chapter "Installing Tmux Plugin Manager"
  if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    run "git -C $HOME/.tmux/plugins/tpm pull --quiet"
    greendot
  else
    run "mkdir -p $HOME/.tmux/plugins/tpm"
    greendot
    run "git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm"
    greendot
  fi
}

setup_git() {
  install_git_userconfig $*

  chapter "Setting up diff-highlight for Git"
  if hash diff-highlight 2>/dev/null; then
    echo "${GREEN}diff-highlight already exists :)"
  else
    mkdir -p $HOME/bin
    curl https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight > $HOME/bin/diff-highlight
    chmod +x $HOME/bin/diff-highlight
  fi
}

install_git_userconfig() {
  chapter "Configuring Git user details"
  filename="$HOME/.gitconfig.user"
  if [ ! -r "$filename" ]; then
    name=$(finger `whoami` | awk -F: '{ print $3 }' | head -n1 | sed 's/^ //')
    vared -p "Name to use for Git commits? " name
    email="`whoami`@"
    vared -p "Email to use for Git commits? " email
    github=`whoami`
    vared -p "Github username? " github

    touch $filename
    echo "[user]" >> $filename
    echo -e "\tname = $name" >> $filename
    echo -e "\temail = $email" >> $filename
    echo "[github]" >> $filename
    echo -e "\tuser = $github" >> $filename
    greendot
  else
    echo "${GREEN}gitconfig.user already exists :)"
  fi
}

main $*
