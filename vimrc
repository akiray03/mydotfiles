"---------------------------------
" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,cp932

"---------------------------------
syntax on
set autoindent  "ENTER時に自動でインデント
set smartindent "賢い自動インデント
set tabstop=8   "ファイル中の<Tab>を、画面上の見た目で何文字分に展開するかを指定する
set noexpandtab
set number       "行番号を表示する
set ruler        "ルーラー(右下に表示される行・列の番号)を表示する

"---------------------------------
set wrapscan     "ファイルの末尾まで検索したら、ファイルの先頭へループする
set ignorecase   "検索で大文字小文字を区別しない
set smartcase    "検索語に大文字が含まれていたら、大文字小文字を区別する
set formatoptions+=mM  "日本語の行の連結時には空白を入力しない
set ambiwidth=double  "□や○の文字があってもカーソル位置がずれないようにする
set backspace=indent,eol,start "eol:改行,start:入力モードに入る前の文字の削除を許可する
set cursorline  "カーソルのある行にアンダーラインを付ける
set scrolloff=5  "カーソルの上または下に表示する最小限の行数。大きくすると、カーソル行が常に画面中央に表示される。
set showmatch   "括弧入力時に対応する括弧を表示する
set wildmenu    "コマンドライン補完するときに強化されたものを使う
set showcmd     "vimコマンドをステータスラインに表示する

"---------------------------------
"Tab、行末の半角スペースを明示的に表示する。
set list
set listchars=tab:^\ ,trail:~

"---------------------------------
" NeoBundle
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
" NeoBundle 'Shougo/neosnippet'
" NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Simple-Javascript-Indenter'
NeoBundle 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

"---------------------------------
" language spacific settings
"set cindent
autocmd FileType sh,bash,zsh setlocal shiftwidth=2 softtabstop=2  expandtab
autocmd FileType rb,ruby,eruby setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd FileType c setlocal shiftwidth=2 tabstop=2 cindent
autocmd FileType html,htmldjango setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType python setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab
autocmd FileType json setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab

filetype on
filetype indent on
filetype plugin on
syntax on

"---------------------------------
"全角スペースを表示
"---------------------------------
"コメント以外で全角スペースを指定しているので scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"全角スペースが強調表示されない場合、ここでscriptencodingを指定すると良い。
"scriptencoding cp932
function! ZenkakuSpace()
  "ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
  "全角スペースを明示的に表示する。
  silent! match ZenkakuSpace /　/
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd VimEnter,BufEnter * call ZenkakuSpace()
  augroup END
endif

"---- neocomplcache の設定
" neocomplcache
let g:NeoComplCache_EnableAtStartup = 1
" 大文字小文字を区別する
let g:NeoComplCache_SmartCase = 1
" キャメルケース補完を有効にする
let g:NeoComplCache_EnableCamelCaseCompletion = 1
" アンダーバー補完を有効にする
let g:NeoComplCache_EnableUnderbarCompletion = 1
" シンタックスファイルの補完対象キーワードとする最小の長さ
let g:NeoComplCache_MinSyntaxLength = 3
" プラグイン毎の補完関数を呼び出す文字数
let g:NeoComplCache_PluginCompletionLength = {
  \ 'keyword_complete'  : 2,
  \ 'syntax_complete'   : 2
  \ }
" ファイルタイプ毎の辞書ファイルの場所
let g:NeoComplCache_DictionaryFileTypeLists = {
            \ 'default' : '',
            \ 'java' : $HOME.'/.vim/dict/j2se14.dict',
            \ 'javascript' : $HOME.'/.vim/dict/javascript.dict',
            \ 'php' : $HOME.'/.vim/dict/PHP.dict',
            \ }

