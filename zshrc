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

if [ -d $HOME/.zshrc.d ]; then
  for file in $HOME/.zshrc.d/*; do
    source "$file"
  done
fi

add_path()
{
  if [ ! -z $1 ] && [ -d $1 ]; then
    export PATH=$1:$PATH
  fi
}

add_path /usr/local/heroku/bin
add_path $HOME/local/gsutil

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
source '/Users/akira/google-cloud-sdk/path.zsh.inc'

# The next line enables shell command completion for gcloud.
source '/Users/akira/google-cloud-sdk/completion.zsh.inc'
