# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}

# "t"max "a"ttach
ta() {
	local name=$1
	if [ -z "$name" ]; then
		echo "[usage] ta <tmux target-session>" >&2
		tmux ls
		return 1
	fi
	if [ $(tmux ls 2>/dev/null | grep "^$name:" | wc -l) -eq 0 ]; then
		tmux attach -t $name
		return $?
	fi
	setTerminalText 1 $name
	tmux attach -t $name
}
