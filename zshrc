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

# The next line updates PATH for the Google Cloud SDK.
if [ -f /Users/akira/google-cloud-sdk/path.zsh.inc ]; then
  source '/Users/akira/google-cloud-sdk/path.zsh.inc'
fi

# The next line enables shell command completion for gcloud.
if [ -f /Users/akira/google-cloud-sdk/completion.zsh.inc ]; then
  source '/Users/akira/google-cloud-sdk/completion.zsh.inc'
fi

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
# rm -f $SDKMAN_DIR/var/{version,candidates}
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
export SDKMAN_DIR="$HOME/.sdkman"
if [ -e "$HOME/.sdkman/bin/sdkman-init.sh" ]; then
  source "$HOME/.sdkman/bin/sdkman-init.sh"
fi
