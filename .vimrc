"--------------------
"neobundleの設定
"-------------------
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
 set runtimepath+=~/.vim/bundle/neobundle.vim
 call neobundle#begin(expand('~/.vim/bundle/'))
endif
" originalrepos on github

"NeoBundle管理-------------------------------------
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'

"入力補完------------------------------------------
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'
NeoBundle 'honza/vim-snippets'
NeoBundle 'Shougo/neocomplete.vim'
" Ruby向けにendを自動挿入してくれる
NeoBundle 'tpope/vim-endwise'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

"Vimのシェル補強----------------------------------
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'grep.vim'
NeoBundle 'Shougo/vimfiler'
" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

"その他便利系-------------------------------------
"シンタックスチェック
NeoBundle 'scrooloose/syntastic'
" インデントに色を付けて見やすくする
NeoBundle 'nathanaelkane/vim-indent-guides'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'
" ステータスラインをリッチにする
NeoBundle 'itchyny/lightline.vim'

"ColorScheme--------------------------------------
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'ujihisa/unite-colorscheme'

NeoBundleCheck

call neobundle#end()
filetype plugin indent on     " required!
filetype indent on

"--------------------
"lightlineの設定
"--------------------
set laststatus=2
set t_Co=256
let g:lightline = {
	\ 'colorscheme':'wombat'
  \} 

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

"--------------------
"基本的な設定
"--------------------

set autoindent
"バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup

"バックアップを作成しない
set nobackup

"クリップボードをMacOSXと連携する
set clipboard=unnamed,autoselect
  
"スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup
   
"タブの代わりに空白文字を指定する
"set expandtab
    
"変更中のファイルでも、保存しないで他のファイルを表示する
set hidden
     
"インクリメンタルサーチを行う
set incsearch
       
"行番号を表示する
set number

"現在のカーソル行のハイライト
hi CursorLineNr ctermbg=4 ctermfg=0
set cursorline
hi clear CursorLine

"閉括弧が入力された時、対応する括弧を強調する
set showmatch        

""タブの設定
"タブを表示するときの幅
set tabstop=2
"タブを挿入するときの幅
set shiftwidth=2

"タブをタブとして扱う
set noexpandtab 

"新しい行を作った時に高度な自動インデントを行う
set smarttab

"全角スペースを可視化する
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
     
if has('syntax')
   augroup ZenkakuSpace
   autocmd!
   autocmd ColorScheme       * call ZenkakuSpace()
   autocmd VimEnter,WinEnter * match  ZenkakuSpace /　/
   augroup END
 call ZenkakuSpace()
endif

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh
      
" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

let g:indent_guides_enable_on_vim_startup = 1

"---------------------
"MacのDeleteキーの挙動変更
"---------------------
set backspace=indent,eol,start

"--------------------
"カラースキームの設定
"-------------------
syntax enable
autocmd ColorScheme * highlight LineNr ctermbg=236 ctermfg=247
"set background=dark

colorscheme jellybeans 
"let g:solarized_termcolors=256

"----------------------
"NeoSnippetの設定
"----------------------
"SnippetPlugn key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
 
"SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
 
"For snippet_complete marker.
if has('conceal')
 set conceallevel=2 concealcursor=i
endif

syntax on
-
"-----------------------
"RSenseの設定
"----------------------
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec"
let g:rsenseUseOmniFunc = 1

