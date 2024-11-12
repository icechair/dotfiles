confdir=$HOME/.config

fpath=(~/.config/zsh/completions $fpath)
# Source manjaro-zsh-configuration
if [[ -e $confdir/zsh/manjaro-zsh-config ]]; then
  source $confdir/zsh/manjaro-zsh-config
fi
powerline-daemon -q
. /usr/share/powerline/bindings/zsh/powerline.zsh

alias vim=nvim
alias vi=nvim
alias vimdiff=nvim -d
export EDITOR=nvim
export QT_QPA_PLATFORMTHEME="qt5ct"
export QT_AUTO_SCREEN_SCALE_FACTOR=0
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export CHROME_EXECUTABLE=/usr/bin/google-chrome-stable
export CPATH="$(clang -v 2>&1 | grep "Selected GCC installation" | rev | cut -d' ' -f1 | rev)/include"

export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.bin
export PATH=$PATH:$HOME/go/bin

[ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
source /usr/share/nvm/nvm.sh
source /usr/share/nvm/bash_completion
source /usr/share/nvm/install-nvm-exec


PICO_SDK_PATH=$HOME/pico/pico-sdk
PICO_EXAMPLES_PATH=$HOME/pico/pico-examples
PICO_EXTRAS_PATH=$HOME/pico/pico-extras
PICO_EXTRAS_PATH=$HOME/pico/pico-playground

alias dotfiles='/usr/bin/git --git-dir="$HOME/.dotfiles/" --work-tree="$HOME"'
compdef _git dotfiles
