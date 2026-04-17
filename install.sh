#!/bin/zsh

export DOTF="$( cd "$( dirname "$0" )" && pwd )"

export GREEN="\033[32m"
export YELLOW="\033[33m"
export BLUE="\033[34m"
export PURPLE="\033[35m"
export RESET="\033[0m"

usage() {
  echo "Usage: $0 [flags]"
  echo ""
  echo "Flags (default: run all):"
  echo "  --prezto      Install and configure Prezto"
  echo "  --dotfiles    Link shell/ctags/ruby/tmux dotfiles"
  echo "  --git         Link and configure Git"
  echo "  --vim         Install Vim plugins and configuration"
  echo "  --neovim      Install Neovim plugins and configuration"
  echo "  --tmux        Install Tmux Plugin Manager"
  echo "  --ghostty     Link Ghostty configuration (macOS)"
  echo "  --i3          Set up i3 configuration"
  echo "  --help        Show this help message"
}

main() {
  local run_all=true
  local do_prezto=false
  local do_dotfiles=false
  local do_git=false
  local do_vim=false
  local do_neovim=false
  local do_tmux=false
  local do_ghostty=false
  local do_i3=false

  for arg in "$@"; do
    case $arg in
      --prezto)   do_prezto=true; run_all=false ;;
      --dotfiles) do_dotfiles=true; run_all=false ;;
      --git)      do_git=true; run_all=false ;;
      --vim)      do_vim=true; run_all=false ;;
      --neovim)   do_neovim=true; run_all=false ;;
      --tmux)     do_tmux=true; run_all=false ;;
      --ghostty)  do_ghostty=true; run_all=false ;;
      --i3)       do_i3=true; run_all=false ;;
      --help)     usage; return 0 ;;
      *) echo "Unknown flag: $arg"; usage; return 1 ;;
    esac
  done

  echo "${PURPLE}Let's do this!$RESET"
  [[ $run_all == true || $do_prezto == true ]]   && install_prezto
  [[ $run_all == true || $do_dotfiles == true ]] && install_dotfiles
  [[ $run_all == true || $do_git == true ]]      && install_git
  [[ $run_all == true || $do_vim == true ]]      && install_vim
  [[ $run_all == true || $do_neovim == true ]]   && install_neovim
  [[ $run_all == true || $do_tmux == true ]]     && install_tmux
  [[ $run_all == true || $do_ghostty == true ]]  && install_ghostty
  [[ $run_all == true || $do_git == true ]]      && setup_git
  [[ $run_all == true || $do_i3 == true ]]       && setup_i3
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
  dirs=('zsh' 'ctags' 'ruby' 'shell' 'tmux')
  for dir in $dirs; do
    chapter "Linking ${(C)dir} configuration files"
    for file ($dir/*); do
      symlink "$DOTF/$file" "$HOME/.${file:t}"
      greendot
    done
  done

  chapter "Installing and linking Starship prompt"
  if ! command -v starship &> /dev/null; then
    if [[ "$(uname)" == "Darwin" ]] && command -v brew &> /dev/null; then
      run "brew install starship"
    else
      run "curl -sS https://starship.rs/install.sh | sh -s -- -y"
    fi
    greendot
  else
    echo "${GREEN}starship already installed :)"
  fi
  run "mkdir -p $HOME/.config"
  symlink "$DOTF/shell/starship.toml" "$HOME/.config/starship.toml"
  greendot
}

install_git() {
  chapter "Linking Git configuration files"
  run "mkdir -p $HOME/.config"
  symlink "$DOTF/git" "$HOME/.config/git"
  greendot
  symlink "$DOTF/git/tigrc" "$HOME/.tigrc"
  greendot
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
  chapter "Installing Neovim plugins and configuration"
  symlink "$DOTF/nvim" "$HOME/.config/nvim"
  greendot
  run "python3 -m venv $HOME/.config/nvim/py3nvim"
  run "$HOME/.config/nvim/py3nvim/bin/python3 -m pip install -q pynvim"
  greendot
}

install_tmux() {
  chapter "Installing Tmux tools and plugins"

  if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    run "git -C $HOME/.tmux/plugins/tpm pull --quiet"
    greendot
  else
    run "mkdir -p $HOME/.tmux/plugins/tpm"
    greendot
    run "git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm"
    greendot
  fi
  run "$HOME/.tmux/plugins/tpm/bin/update_plugins all"

  if ! command -v tmux-snaglord &> /dev/null; then
    if [[ "$(uname)" == "Darwin" ]] && command -v brew &> /dev/null; then
      run "brew install raine/tmux-snaglord/tmux-snaglord"
    else
      run "curl -fsSL https://raw.githubusercontent.com/raine/tmux-snaglord/main/scripts/install.sh | bash"
    fi
    greendot
  else
    echo "${GREEN}tmux-snaglord already installed :)"
  fi
  run "mkdir -p $HOME/.config/tmux-snaglord"
  symlink "$DOTF/tmux/tmux-snaglord.toml" "$HOME/.config/tmux-snaglord/config.toml"
  greendot
}

setup_git() {
  install_git_userconfig

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

install_ghostty() {
  if [[ "$(uname)" != "Darwin" ]]; then
    return
  fi
  chapter "Linking Ghostty configuration"
  ghostty_dir="$HOME/Library/Application Support/com.mitchellh.ghostty"
  run "mkdir -p \"$ghostty_dir\""
  symlink "$DOTF/ghostty/config" "$ghostty_dir/config"
  greendot
}

setup_i3() {
  if [ "i3 exists" ]; then
    mkdir -p $HOME/.config/i3
    mkdir -p $HOME/.config/i3status

    symlink "$DOTF/i3/config" "$HOME/.config/i3/config"
    symlink "$DOTF/i3/status.config" "$HOME/.config/i3status/config"

    mkdir -p $HOME/bin
    for script in i3-custom-status i3-pixel-lock keyboard-toggle locker; do
      symlink "$DOTF/i3/$script.sh" "$HOME/bin/$script"
    done
  fi
}

main $*
