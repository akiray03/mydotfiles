if [ ! -d "$HOME/go" ]; then
  mkdir $HOME/go
fi
export GOPATH="$HOME/go"
export PATH=$GOPATH/bin:$PATH

if [ -d $HOME/local/go_appengine ]; then
  export PATH=$HOME/local/go_appengine:$PATH
fi

export GOENVGOROOT=$HOME/.goenvs
export GOENVTARGET=$HOME/bin
export GOENVHOME=$HOME/workspace
