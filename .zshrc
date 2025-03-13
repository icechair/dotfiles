# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

zshconf="${XDG_CONF_DIR:-$HOME/.config}/zsh"

source ~/.zplug/init.zsh

fpath=($zshconf/completions $fpath)
# Source manjaro-zsh-configuration
if [[ -e $zshconf/manjaro-zsh-config ]]; then
  source $zshconf/manjaro-zsh-config
fi
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
zplug romkatv/powerlevel10k, as:theme, depth:1
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $zshconf/p10k.zsh ]] || source $zshconf/p10k.zsh
