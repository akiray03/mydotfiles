# users generic .zshrc file for zsh(1)

export DOTFILES_ROOT="$HOME/.mydotfiles"

typeset -U path

# Enable zsh version conditional branch.
autoload -Uz is-at-least

# Enable hook function manipulation.
autoload -Uz add-zsh-hook

add_path()
{
  if [ ! -z $1 ] && [ -d $1 ]; then
    export PATH=$1:$PATH
  fi
}

add_path /usr/local/bin
add_path /usr/local/heroku/bin
add_path $HOME/local/gsutil
if [ -d $HOME/local/tfenv/bin ]; then
  export PATH=$HOME/local/tfenv/bin:$PATH
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

for file in "$DOTFILES_ROOT"/functions/*.zsh; do
  source "$file"
done

for file in "$DOTFILES_ROOT"/zshrc.d/*.zsh; do
  source "$file"
done

if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*.zsh; do
    source "$file"
  done
fi

# Scalaを使う所で以下を記述
# export SDKMAN_DIR="$HOME/.sdkman"
# if [ -e "$SDKMAN_DIR/bin/sdkman-init.sh" ]; then
#   source "$SDKMAN_DIR/bin/sdkman-init.sh"
# fi

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/tfschema tfschema
