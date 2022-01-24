se encoding=utf-8
scriptencoding utf-8

" Auto install plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

    augroup PLUG
        au!
        autocmd VimEnter * PlugInstall
    augroup END
endif
autocmd VimEnter * PlugInstall
""""""""""""""""""""""""""""""""""""""""
" Plugins {{{
""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" FZF
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	nnoremap ,. :FZF<CR>

" Vim Ags
Plug 'gabesoft/vim-ags'
	let g:ags_results_per_tab = 0
	let g:ags_winheight = '20'
	let g:ags_agargs = {
	\ '--ignore'            : [ '{south_migrations,migrations}', '-i' ],
	\ '--break'             : [ '', '' ],
	\ '--color'             : [ '', '' ],
	\ '--color-line-number' : [ '"1;30"', '' ],
	\ '--color-match'       : [ '"32;40"', '' ],
	\ '--color-path'        : [ '"1;31"', '' ],
	\ '--column'            : [ '', '' ],
	\ '--context'           : ['g:ags_agcontext', '-C' ],
	\ '--filename'          : [ '',  '' ],
	\ '--group'             : ['', '' ],
	\ '--heading'	   : [ '', '-H' ],
	\ '--max-count'	   : ['g:ags_agmaxcount', '-m' ],
	\ '--numbers': [ '', '' ]
	\ }
	nnoremap <C-F> :Ags<Space>

" TagbaR
Plug 'majutsusHi/tagBAR'
	let g:tagbar_autoclose = 1
	set tags=./tags,tags;$HOME
	nnoremap ,, :Tags<CR>
	nnoremap ,t :TagbarToggle<CR>
	nnoremap <Leader>tt :GenerateTags<CR>

" Nerdtools
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
	nnoremap ,n :NERDTreeFind<CR>
	nnoremap ,m :NERDTreeToggle<CR>
	let NERDTreeQuitOnOpen = 1
	let NERDTreeIgnore = ['\.pyc$', '__pycache__']

	" NERDTress File highlighting
	function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
	endfunction

	call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
	call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
	call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
	call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
	call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
	call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
	call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
	call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" ALE Lint
Plug 'w0rp/ale'
	let g:ale_sign_warning = '.'
	let g:ale_lint_on_enter = 0

" easymotion
Plug 'easymotion/vim-easymotion'
	map <Leader> <Plug>(easymotion-prefix)
	map <Plug>(easymotion-prefix)w <Plug>(easymotion-bd-w)
	map <Plug>(easymotion-prefix)e <Plug>(easymotion-bd-e)
	nmap <Leader>f <Plug>(easymotion-overwin-f)

" Vim session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
	let g:session_directory = $HOME.'/.vim/sessions/'
	let g:session_command_aliases = 1
	let g:session_autosave = 'yes'
	let g:session_autoload = 'yes'

" Macro management
Plug 'fakeezz/marvim'
	let g:marvim_prefix_on_load = 0

" Visual
Plug 'jdsimcoe/abstract.vim'


" Vim Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
	let g:airline_theme='abstract'

Plug 'ryanoasis/vim-devicons'

" Chore
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
	nmap ys <Plug>Ysurroundw
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
Plug 'iamcco/markdown-preview.vim'

" Ctags improved
Plug 'jsfaint/gen_tags.vim'
	let g:gen_tags#statusline = 1
	let g:gen_tags#ctags_auto_gen = 1
	let g:gen_tags#ctags_opts = [
        	\ "--python-kinds=+cfm-x",
	        \ "--exclude=['node_modules', '__pycache__']",
	        \ "--append=no"
	    \ ]
	let g:gen_tags#use_cache_dir = 0

" Window navigation
Plug 't9md/vim-choosewin'
	nmap - <Plug>(choosewin)

" Window navigation plugin for Nerdtree
Plug 'weilbith/nerdtree_choosewin-plugin'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
	let g:UltiSnipsExpandTrigger="<tab>"
	let g:UltiSnipsJumpBackwardTrigger="<c-c>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"

" Autocompletion
" Deoplete
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
    Plug 'Shougo/deoplete.nvim'
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
""""""""""""""""""""""""""""""""""""""""
" Language specific
""""""""""""""""""""""""""""""""""""""""
" Python
Plug 'jeetsukumaran/vim-pythonsense', {'for': 'python'}

filetype plugin indent on

call plug#end()

""""""""""""""""""""""""""""""""""""""""
" Post plugin loading configs
""""""""""""""""""""""""""""""""""""""""
" Colorscheme
colorscheme abstract

" Deoplete
call deoplete#custom#option('max_list', 5)


""""""""""""""""""""""""""""""""""""""""
" }}}
""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""
" General configs {{{
""""""""""""""""""""""""""""""""""""""""

syntax on
syntax enable

set undofile
set undodir=/home/joao.menezes/vim_cache

set hidden
set hlsearch
set incsearch
set clipboard=unnamedplus
set nocp
set ruler
set showcmd
set showmode
set relativenumber
set nu
set shortmess+=A "destroys swap files
set nofoldenable
set foldmethod=indent
set nocompatible
set encoding=utf8
set backspace=indent,eol,start
set splitright
set splitbelow
set noswapfile
set number
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set laststatus=2
set ignorecase
set autoread
set pastetoggle=<C-P>
set incsearch
set redrawtime=10000
set timeoutlen=1000
set ttimeoutlen=0
set scrolloff=5
""""""""""""""""""""""""""""""""""""""""
" }}}
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""
" #Mappings/Functions {{{
""""""""""""""""""""""""""""""""""""""""
command! PrettyXML call utils#do_pretty_xml()

noremap <Leader>cp "+y:echo 'selection copied!'<CR>
noremap <Leader>cl <Esc>0v$h"+y:echo 'line copied!'<CR>
nnoremap <Leader>cw viw"+y:echo 'word copied!'<CR>
vnoremap // y/<C-R>"<CR>

" Source .vimrc
nnoremap <Leader>vs :source ~/.vimrc<CR>

" Zoom
nnoremap <Leader>z :call utils#window_zoom()<CR>

" Move line up/down
nnoremap <Leader>- :m-2<CR>
nnoremap <Leader>_ :m+1<CR>
" Replace on visual selection
vnoremap <C-R> :s/\%V

" tags -> jumps
nnoremap <C-]> <Esc>:exe "tjump " . expand("<cword>")<Esc>

" jump splitting vertical
nnoremap <C-W>] <C-W>v<C-]>

""""""""""""""""""""""""""""""""""""""""
" }}}
""""""""""""""""""""""""""""""""""""""""
