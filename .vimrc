" meinside's .vimrc file for vim or neovim,
" created by meinside@gmail.com,
" last update: 2017.09.19.
"
" XXX - for neovim:
"
" $ pip install --upgrade neovim
" $ mkdir -p ~/.config/nvim
" $ ln -sf ~/.vimrc ~/.config/nvim/init.vim

if has('nvim')	" settings for nvim only
	set termguicolors
	colo pablo
	set mouse-=a	" not to enter visual mode when dragging text
	let g:go_term_enabled=1	" XXX - it needs to be set for 'delve' (2017.02.10.)
else	" settings for vim only
	set t_Co=256
	colo elflord
endif

""""""""""""""""""""""""""""""""""""
" settings for vundle (https://github.com/VundleVim/Vundle.vim)
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
let vundle_fresh=0
if !filereadable(vundle_readme)
	echo "Installing Vundle..."
	echo ""
	silent execute "!git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim"
	let vundle_fresh=1
endif

set nocompatible	" be iMproved, required
filetype off		" required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

""""""""
" vundle packages
"

" Useful plugins
Plugin 'matchit.zip'
Plugin 'ragtag.vim'	" TAG + <ctrl-x> + @, !, #, $, /, <space>, <cr>, ...
Plugin 'surround.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
let g:airline#extensions#ale#enabled = 1
Plugin 'airblade/vim-gitgutter'	" [c, ]c for prev/next hunk
let g:gitgutter_highlight_lines = 1
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '⎸'
let g:indentLine_enabled = 0	" :IndentLinesToggle

" For autocompletion
if has('nvim')
	Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }	" XXX - python3 needed ($ pip3 install --upgrade neovim)
	let g:deoplete#enable_at_startup = 1
endif

" For source file browsing, XXX: ctags is needed! ($ brew install ctags)
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" For uploading Gist (:Gist / :Gist -p / :Gist -a / ...)
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" For syntax checking
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" > Haskell:
" $ stack install hlint ghc-mod
" > Go:
let g:syntastic_go_checkers = ['govet', 'errcheck', 'go']

" For Ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-endwise'

" For Go
Plugin 'fatih/vim-go'
if has('nvim')
	Plugin 'jodosha/vim-godebug'	" For :GoToggleBreakpoint / :GoDebug ($ brew install go-delve/delve/delve)
	Plugin 'zchee/deoplete-go', { 'do': 'make'}	" For autocompletion
endif
let g:go_fmt_command = "goimports"	" auto import dependencies
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1

" For Haskell
if has('nvim')
	Plugin 'neovimhaskell/haskell-vim'
endif
if executable('hindent')
	Plugin 'alx741/vim-hindent'	" $ stack install hindent
endif
if executable('ghc-mod')
	Plugin 'eagletmt/neco-ghc'	" $ stack install ghc-mod
	let g:haskellmode_completion_ghc = 0
endif

" For Python
if has('nvim')
	Plugin 'zchee/deoplete-jedi'	" For autocompletion
endif

" For JavaScript and React
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:javascript_plugin_flow=1
let g:jsx_ext_required=0

" For vim-codefmt (:FormatLines, :FormatCode)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'

"" For snippets
"" - Ruby: https://github.com/honza/vim-snippets/blob/master/UltiSnips/ruby.snippets
"" - Go: https://github.com/honza/vim-snippets/blob/master/UltiSnips/go.snippets
"Plugin 'SirVer/ultisnips'
"Plugin 'honza/vim-snippets'
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"	" <tab> for next placeholder
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"	" <shift-tab> for previous placeholder
"let g:UltiSnipsEditSplit="vertical"

"
""""""""

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" install bundles if not installed yet
if vundle_fresh == 1
	echo "Installing bundles..."
	echo ""
	:BundleInstall
endif

"
""""""""""""""""""""""""""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup	" do not keep a backup file, use versions instead
set history=50	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch	" do incremental searching
set cindent
set ai
set smartindent
set nu
set ts=4
set sw=4
set sts=4
set fencs=ucs-bom,utf-8,korea
set termencoding=utf-8
set wildmenu	" visual autocomplete for command menu
set showbreak=↳
set breakindent

" for running correct rvm ruby (not osx's default ruby) in zsh
set shell=/bin/bash

" Don't use Ex mode, use Q for formatting
map Q gq

" file browser (netrw)
" :Ex, :Sex, :Vex
let g:netrw_liststyle = 3
let g:netrw_winsize = 30
" <F2> for vertical file browser
nmap <F2> :Vex <CR>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")
	" Put these in an autocmd group, so that we can delete them easily.
	augroup vimrcEx
		au!

		" For all text files set 'textwidth' to 78 characters.
		autocmd FileType text setlocal textwidth=78

		" For html/javascript/css
		autocmd FileType htm,html,js set ai sw=2 ts=2 sts=2 et
		autocmd FileType css,scss set ai sw=2 ts=2 sts=2 et

		" For programming languages
		" Golang
		autocmd FileType go set ai sw=4 ts=4 sts=4 noet
		" Ruby
		autocmd FileType ruby,eruby,yaml set ai sw=2 ts=2 sts=2 et
		" Python
		autocmd FileType python set ai sw=2 ts=2 sts=2 et
		" Haskell
		autocmd FileType haskell set ai sw=2 ts=2 sts=2 et
		if executable('ghc-mod')
			autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
		endif

		" When editing a file, always jump to the last known cursor position.
		" Don't do it when the position is invalid or when inside an event handler
		" (happens when dropping a file on gvim).
		autocmd BufReadPost *
					\ if line("'\"") > 0 && line("'\"") <= line("$") |
					\   exe "normal g`\"" |
					\ endif
	augroup END
else
	set autoindent		" always set autoindenting on
endif " has("autocmd")

