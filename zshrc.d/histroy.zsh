STFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

setopt appendhistory extendedglob

# historyの共有
#setopt share_history

# 余分な空白は詰める
setopt hist_reduce_blanks

# add history when command executed.
setopt inc_append_history

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

