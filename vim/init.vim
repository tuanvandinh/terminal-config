set nocompatible
set guicursor=
filetype off
" Settings Vundle
" usage:
" :PluginInstall
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")
Plugin 'VundleVim/Vundle.vim'
call vundle#end()
filetype plugin indent on

"Plugin 'scrooloose/nerdTree'
""autocmd vimenter * NERDTree
"nmap <C-E> :NERDTreeToggle<CR>

"" using default netrw :Lexplore instead of nerdTree
"" Toggle Lexplore with F6
"map <silent> <C-E> :Lexplore<CR>
"let g:netrw_banner = 0
"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"let g:netrw_winsize = 10
let g:netrw_liststyle = 3


" theme color and background
Plugin 'flazz/vim-colorschemes'
Plugin 'liuchengxu/space-vim-dark'
colorscheme space-vim-dark


"Plugin 'joshdick/onedark.vim'
"syntax on
"colorscheme onedark

"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE

"let g:space_vim_dark_background = 235 " set empty quotes to make it transparent
"color space-vim-dark

"Plugin 'tomasiser/vim-code-dark'
"colorscheme codedark
"let g:airline_theme = 'codedark'



" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
"set colorcolumn=80
highlight ColorColumn ctermbg=233
nnoremap <F2> :set nonumber!<CR>

" Showing indent lines
Plugin 'Yggdroot/indentLine'
let g:indentLine_enabled = 0
nmap <F3> :IndentLinesToggle<CR>

Plugin 'vim-airline/vim-airline'

"Plugin 'scrooloose/syntastic'
"g:syntastic_python_checkers

" preferences
inoremap jk <ESC>
set incsearch

Plugin 'jiangmiao/auto-pairs'
g:AutoPairs
"Plugin 'windwp/nvim-ts-autotag'

Plugin 'tpope/vim-surround'


" alias section
"command rel edb shell input text "RR"
"set shell=/bin/zsh


Plugin 'SirVer/ultisnips'
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/UltiSnips']

" remap section
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" toggle section
set pastetoggle=<F1>

" enable mouse
set mouse=a

" easier moving of code blocks
" Try to go into visual mode (v), thenselect several lines of code here and
" then press ``>`` several times.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/


" Rebind <Leader> key
" I like to have it here becuase it is easier to reach than the default and
" it is next to ``m`` and ``n`` which I use for navigating between tabs.
let mapleader = ","

" remap
" d => "delete"
" leader d => "cut"
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D
vnoremap d "_d

nnoremap <leader>d ""d
nnoremap <leader>D ""D
vnoremap <leader>d ""d


" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" ignore case sensitive
:set ic

" show relativenumber
"set nu relativenumber

" highlight cursorline
set cursorline

" copy to clipboard
noremap <C-c> "+y

" ctrl s for save
:nmap <c-s> :w<CR>
:imap <c-s> <Esc>:w<CR>a




" ============================================================================
" Vim Custom Command
" ============================================================================

" check duplicate lines
:command CheckDuplicate syn clear Repeat | g/^\(.*\)\n\ze\%(.*\n\)*\1$/exe 'syn match Repeat "^' . escape(getline('.'), '".\^$*[]') . '$"' | nohlsearch

" format json
com! FormatJson %!python -m json.tool

" remove unwanted spaces
com! RemoveSpaces :%s/\s\+$//e

com! QuoteComma :%s/\w\+/"&",/g | $s/,$//

" format xml
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
nnoremap = :FormatXML<Cr>

" Python IDE Setup
" ============================================================================


map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>


" Autocomplete for python
if has('nvim')
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Use deoplete.
let g:python3_host_prog = 'python3'
let g:deoplete#enable_at_startup = 1

Plugin 'zchee/deoplete-jedi'

endif

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
"set expandtab

autocmd Filetype python setlocal ts=4 sw=4 sts=4


" Settings for flake8
" Press <F7> to run flake8 on it
"Plugin 'nvie/vim-flake8'

" autoformat python black
" :Black to format the entire file (ranges not supported)
" to autorun black on save
" autocmd BufWritePre *.py execute ':Black'
Plugin 'python/black'


" Settings for ctrlp
Plugin 'ctrlp.vim'
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*



" Settings for SimplyFold
" commands are zc to close a fold and zo to open one
Plugin 'tmhedberg/SimpylFold'
set nofoldenable


" Settings for jedi-vim
" cd ~/.vim/bundle
" git clone git://github.com/davidhalter/jedi-vim.git
"" let g:jedi#usages_command = "<leader>z"
"" let g:jedi#popup_on_dot = 0
"" let g:jedi#popup_select_first = 0


" ============================================================================
" Javascript IDE Setup
" ============================================================================
Plugin 'leafgarland/typescript-vim'


Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.vue,*.yaml,*.html Prettier


"Plugin 'sbdchd/neoformat'
"autocmd BufWritePre *.js Neoformat
"
"Plugin 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
"Plugin 'carlitux/deoplete-ternjs'
"
"let g:deoplete#enable_at_startup = 1
"let g:deoplete#enable_ignore_case = 1
"let g:deoplete#enable_smart_case = 1
"let g:deoplete#enable_camel_case = 1
"let g:deoplete#enable_refresh_always = 1
"let g:deoplete#max_abbr_width = 0
"let g:deoplete#max_menu_width = 0
"let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
"
"let g:tern_request_timeout = 1
"let g:tern_request_timeout = 6000
"let g:tern#command = ["tern"]
"let g:tern#arguments = ["--persistent"]
"
"
"Plugin 'jelera/vim-javascript-syntax'



"function! StrTrim(txt)
"  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
"endfunction
"
"let g:flow_path = StrTrim(system('PATH=$(npm bin):$PATH && which flow'))
"
"if g:flow_path != 'flow not found'
"  let g:deoplete#sources#flow#flow_bin = g:flow_path
"endif

"Plugin 'flowtype/vim-flow'
"Plugin 'wokalski/autocomplete-flow'
"  " For func argument completion
"Plugin 'Shougo/neosnippet'
"Plugin 'Shougo/neosnippet-snippets'
"" neosnippet
"let g:neosnippet#enable_completed_snippet = 1
