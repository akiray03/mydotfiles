export DOTFILES_ROOT="$HOME/.mydotfiles"

for file in "$DOTFILES_ROOT"/functions/*; do
  source "$file"
done

for file in "$DOTFILES_ROOT"/zprofile.d/*; do
  source "$file"
done
