function add_path()
{
	local p=$1
	local pos=$2
	if [ -e $p ]; then
		if [ "x$pos" = "xtop" ]; then
			PATH=$p:$PATH
		else
			PATH=$PATH:$p
		fi
	fi
}

add_path "$DOTFILES_ROOT/bin"
add_path "$HOME/local/bin" top
add_path "$HOME/local/sbin" top
add_path "$HOME/bin" top
add_path "$HOME/sbin" top
add_path "$HOME/local/terraform" top

add_path "/usr/local/bin" top
add_path "/usr/local/sbin" top

add_path "/usr/sbin"
add_path "/sbin"

add_path "/usr/local/google_appengine"

# path, PATH の重複を削除する
typeset -U path PATH

# 環境変数
export PATH
