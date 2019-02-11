# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/path.zsh.inc"
fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  source "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

if [ -f ~/.pyenv/versions/2.7.13/bin/python ]; then
  export CLOUDSDK_PYTHON=~/.pyenv/versions/2.7.13/bin/python
fi
if [ -f ~/.pyenv/versions/2.7.15/bin/python ]; then
  export CLOUDSDK_PYTHON=~/.pyenv/versions/2.7.15/bin/python
fi
