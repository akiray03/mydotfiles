"---------------------------------
" dein
"---------------------------------
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.mydotfiles/vim-dein-rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

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
" language spacific settings
"set cindent
autocmd FileType sh,bash,zsh setlocal shiftwidth=2 softtabstop=2  expandtab
autocmd FileType rb,ruby,eruby,yaml setlocal softtabstop=2 shiftwidth=2 expandtab
autocmd FileType c setlocal shiftwidth=2 tabstop=2 cindent
autocmd FileType html,htmldjango setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2 tabstop=2 expandtab
autocmd FileType python setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab
autocmd FileType json setlocal softtabstop=4 shiftwidth=4 tabstop=4 expandtab

au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et

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

" vim-json の JSONダブルクォーテーション非表示機能を無効化
" https://qiita.com/kadoppe/items/ffaef1f5a69f2cfcf12e
let g:vim_json_syntax_conceal = 0
