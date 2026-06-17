# Enable Powerlevel10k instant prompt when available.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_THEME="${ZSH_THEME:-robbyrussell}"

plugins=(
  git
  colorize
  z
  sudo
  zsh-autosuggestions
  zsh-syntax-highlighting
)

if [ -f "$ZSH/oh-my-zsh.sh" ]; then
  source "$ZSH/oh-my-zsh.sh"
fi

alias venv="source .venv/bin/activate"

if [ -f "$HOME/.p10k.zsh" ]; then
  source "$HOME/.p10k.zsh"
fi

# Keep tokens, private paths, and machine-specific exports out of git.
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
