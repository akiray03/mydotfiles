# ls
if [ "$(uname)" != "Darwin" ]; then
	alias ls="ls --color"
fi
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

# lv
alias lv='lv -c'

# process
alias j="jobs -l"
alias 'ps?'='pgrep -l -f'
alias pk='pkill -f'

# du/df
alias du="du -h"
alias df="df -h"
alias duh="du -h ./ --max-depth=1"

# su
alias su="su -l"

# vim
alias 'src'='exec zsh'
alias -g V="| vim -"

# grep
alias 'gr'='grep --color=auto -RUIn'

#make
alias 'm'='make'
alias 'mn'='make native-code'
alias 'mc'='make clean'

# screen
alias s='screen -U'
alias sc='screen -S main'
alias sn='screen'
alias sl='screen -ls'
alias sr='screen -r main'
alias srr='screen -U -D -RR'

# tmux
alias tm='tmux'
alias tma='tmux attach'
alias tml='tmux list-window'

alias pon='predict-on'
alias poff='predict-off'
alias p='ping -c 4'

#alias ls='ls -al'
alias cp='nocorrect cp -irp'
alias refe='nocorrect refe'

# git
alias g='git'
alias gi='git'
alias oppai='git'

alias java='nocorrect java'
alias cp='nocorrect cp -irp'
alias erl='nocorrect erl'
alias sbcl='nocorrect sbcl'
alias gosh='nocorrect gosh'
alias node='nocorrect node'
alias hg='nocorrect hg --encoding=utf-8'

# scala
alias scala='scala -deprecation -unchecked -explaintypes'
alias scc='scalac -deprecation -unchecked -explaintypes'
alias sci='scala -deprecation -unchecked -explaintypes -cp $SCALA_CLASSPATH -i ~/import.scala'
alias sce='scala'

# extract http://d.hatena.ne.jp/jeneshicc/20110215/1297778049
extract () {
  if [ -f $1 ] ; then
      case $1 in
          *.tar.bz2)   tar xvjf $1    ;;
          *.tar.gz)    tar xvzf $1    ;;
          *.tar.xz)    tar xvJf $1    ;;
          *.bz2)       bunzip2 $1     ;;
          *.rar)       unrar x $1     ;;
          *.gz)        gunzip $1      ;;
          *.tar)       tar xvf $1     ;;
          *.tbz2)      tar xvjf $1    ;;
          *.tgz)       tar xvzf $1    ;;
          *.zip)       unzip $1       ;;
          *.Z)         uncompress $1  ;;
          *.7z)        7z x $1        ;;
          *.lzma)      lzma -dv $1    ;;
          *.xz)        xz -dv $1      ;;
          *)           echo "don't know how to extract '$1'..." ;;
      esac
  else
      echo "'$1' is not a valid file!"
  fi
}
alias ex='extract'

alias ev='vi ~/.mydotfiles/vimrc'
