# users generic .zshrc file for zsh(1)

export DOTFILES_ROOT="$HOME/.mydotfiles"

typeset -U path

# Enable zsh version conditional branch.
autoload -Uz is-at-least

# Enable hook function manipulation.
autoload -Uz add-zsh-hook

for file in "$DOTFILES_ROOT"/functions/*; do
  source "$file"
done

for file in "$DOTFILES_ROOT"/zshrc.d/*; do
  source "$file"
done