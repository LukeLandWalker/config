" be iMproved
set nocompatible

" Vundle setting {
	filetype off " required!

	set rtp+=~/.vim/bundle/vundle/
	set rtp+=$GOROOT/misc/vim
	call vundle#rc()

	" let Vundle manage Vundle(required!)
	Bundle 'gmarik/vundle'

	" plugins repos {
		" a css/html helper
		Bundle 'mattn/emmet-vim'

		Bundle 'rdoc'

		" Mini buffer
		"Bundle 'minibufexplorerpp'
		Bundle 'jeetsukumaran/vim-buffergator'

		" The-NERD-tree
		Bundle 'The-NERD-tree'

		" Commenter for many lang
		Bundle 'The-NERD-Commenter'

		" Taglist
		"Bundle 'taglist.vim'
		Bundle 'majutsushi/tagbar'

		" Ruby on Rails plugin
		Bundle 'tpope/vim-rails'

		" match ()
		Bundle 'matchit.zip'

		" a color colorscheme
		Bundle 'chriskempson/vim-tomorrow-theme'

		" Auto close the block
		Bundle 'AutoClose'

		" Get git  branch status
		"Bundle 'Git-Branch-Info'

		" ctrlp.vim
		Bundle 'ctrlp.vim'

		" Markdown hightline plugin
		Bundle 'Markdown'

		" Less css hightline plugin
		Bundle 'groenewege/vim-less'

		" Indent for ruby
		Bundle 'vim-ruby/vim-ruby'

		" Golang plugins
		Bundle 'fatih/vim-go'

		" Coffee script
		Bundle 'kchmck/vim-coffee-script'

		" Code formater
		Bundle 'godlygeek/tabular'

		" Dash plugins
		Bundle 'rizzatti/funcoo.vim'
		Bundle 'rizzatti/dash.vim'

		" Let command :saveas to delete the old file
		Bundle 'danro/rename.vim'

		" thrift highlight
		Bundle 'solarnz/thrift.vim'

		Bundle 'junegunn/goyo.vim'

		"Bundle 'AutoComplPop'

		" brew install the_silver_searcher
		" apt-get install silversearcher-ag
		Bundle 'rking/ag.vim'

		Bundle 'cespare/vim-toml'

		" 语法检测
		Bundle 'scrooloose/syntastic'

		"Powerline
		Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
	" }

	" required!
	filetype plugin indent on
" }

" Fast zoom panel {
	map + <C-w>+
	map - <C-w>-
" }

" NERDTree setting {
	map <C-o> :NERDTreeToggle<CR>
" }

" Tabbar setting {
	" Mapping Toggle the Tabbar
	map <C-g> :TagbarToggle<CR>
" }

" format setting {
	" show line number
	set number

	" set `<<` and `>>` command offset width become 4
	set shiftwidth=4

	" set BS key delete 4 space at once press
	"set softtabstop=4

	" set tab width is 4
	set tabstop=4

	" set text width to 80 chars and give a colorcolumn to mark
	set textwidth=80
	set colorcolumn=+1

	set display=lastline

	" set cursor margin top and bottom 3 lines
	set so=3

	" set indent for diff lang {
		autocmd FileType ruby       set shiftwidth=2 | set expandtab
		autocmd FileType eruby      set shiftwidth=2 | set expandtab
		autocmd FileType erlang     set shiftwidth=2 | set expandtab
		autocmd FileType lua        set shiftwidth=4 | set expandtab
		autocmd FileType html       set shiftwidth=2 | set expandtab
		autocmd FileType javascript set shiftwidth=2 | set expandtab
		autocmd FileType json       set shiftwidth=2 | set expandtab
		autocmd FileType php        set shiftwidth=4 | set expandtab
		autocmd FileType objc       set shiftwidth=4 | set expandtab
	" }
" }

" display setting {
	" set statue line
	set laststatus=2

	" hightline the search chars
	set hlsearch

	" jump intime when search
	set incsearch

	" show tabs and spaces at the end of line
	set list
	set listchars=""
	if &termencoding ==# 'utf-8' || &encoding ==# 'utf-8'
		set listchars=tab:»\ 
		set listchars+=trail:·
		"set listchars+=eol:¶
	else
		set listchars=tab:>\ 
		set listchars+=trail:.
		"set listchars+=eol:~
	endif

	" syntax on
	syntax on

	" set backspace
	set backspace=indent,eol,start
" }

" key map {
	" <leader> key setting {
		let mapleader = ","
		let g:mapleader = ","
	" }

	" Fast saving
	nmap <leader>w :w!<CR>

	" Fast split window
	nmap <leader>- :sp<CR>
	nmap <leader>\| :vsp<CR>

	" fast change panel {
		nmap <Tab> <C-w>w
		nmap <c-h> <c-w><c-h>
		nmap <c-j> <c-w><c-j>
		nmap <c-k> <c-w><c-k>
		nmap <c-l> <c-w><c-l>
	" }
" }

" other setting {
	" Set to auto read when a file is changed from the outside
	set autoread

	" no backup
	set nobackup

	" let vim use system clipboard
	set clipboard=unnamed
" }

" Tagbar for Golang {
	let g:tagbar_type_go = {
		\ 'ctagstype' : 'go',
		\ 'kinds'     : [
			\ 'p:package',
			\ 'i:imports:1',
			\ 'c:constants',
			\ 'v:variables',
			\ 't:types',
			\ 'n:interfaces',
			\ 'w:fields',
			\ 'e:embedded',
			\ 'm:methods',
			\ 'r:constructor',
			\ 'f:functions'
		\ ],
		\ 'sro' : '.',
		\ 'kind2scope' : {
			\ 't' : 'ctype',
			\ 'n' : 'ntype'
		\ },
		\ 'scope2kind' : {
			\ 'ctype' : 't',
			\ 'ntype' : 'n'
		\ },
		\ 'ctagsbin'  : 'gotags',
		\ 'ctagsargs' : '-sort -silent'
	\ }
" }

" Tabularize setting {
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:\zs<CR>
	vmap <Leader>a: :Tabularize /:\zs<CR>
	nmap <Leader>a> :Tabularize /=><CR>
	vmap <Leader>a> :Tabularize /=><CR>

	"inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
	"function! s:align()
		"let p = '^\s*|\s.*\s|\s*$'
		"if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
			"let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
			"let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
			"Tabularize/|/l1
			"normal! 0
			"call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
		"endif
	"endfunction
" }

" Go plugin disable auto install {
	let g:go_disable_autoinstall = 1
	let g:go_fmt_autosave = 1
	let g:go_highlight_functions = 0
	let g:go_highlight_methods = 0
	let g:go_highlight_structs = 1
	let g:go_highlight_operators = 0
	let g:go_highlight_build_constraints = 1
	let g:go_fmt_command = "goimports"
	let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
	let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" }

" Goyo configure {
	let g:goyo_width = 80
	function! s:goyo_enter()
		if exists('$TMUX')
			silent !tmux set status off
		endif
		set noshowmode
		set noshowcmd
		set scrolloff=999
		"Limelight
	endfunction
	function! s:goyo_leave()
		if exists('$TMUX')
			silent !tmux set status on
		endif
		set showmode
		set showcmd
		set scrolloff=5
		"Limelight!
	endfunction
	autocmd! User GoyoEnter nested call <SID>goyo_enter()
	autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }

" ctrlp ignore list {
	set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.beam
" }

" statusline {
hi User1 guibg=#555555 guifg=#454545
hi User2 guibg=#555555 guifg=Gray
hi User3 guibg=#555555 guifg=White
set statusline=\ 
set statusline+=%t%m
set statusline+=%=%{''.(&fenc!=''?&fenc:&enc).''}
set statusline+=\ │\ 
set statusline+=%{&ff}
set statusline+=\ │\ 
set statusline+=%y
set statusline+=\ │\ 
set statusline+=[%-8.10(%l,%c%)\ %-4.(%p%%%)]
" }

" be iMproved
set nocompatible
