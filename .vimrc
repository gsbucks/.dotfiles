set nocompatible
filetype off
syntax enable
set mouse=""

set foldmethod=syntax
set foldlevel=9999

" Set , to be leader key
let mapleader = ","

"set termguicolors
set background=dark
"let g:solarized_termcolors=256
colorscheme solarized
set guifont=AndaleMono:h14
set guioptions-=T
set hlsearch
set backspace=2
set backupcopy=yes " writes could cause webpack not to reload
set clipboard=unnamedplus

set completeopt-=preview "stop opening autocomplete window in vim-go

" cedit defaults to C-F, which is my tmux prefix. cedit is:
" 'The key used in Command-line Mode to open the command-line window'
set cedit=<C-N>

" Dont ask to re-read files changed outside vim
set autoread

set relativenumber
set number

" original repos on github
"git clone git://github.com/tpope/vim-fugitive
"git clone git://github.com/tpope/vim-surround
"git clone git://github.com/tpope/vim-unimpaired
"git clone git://github.com/tpope/vim-repeat
"git clone git://github.com/tpope/vim-commentary
"git clone git://github.com/tpope/vim-eunuch
"git clone git://github.com/kien/ctrlp.vim
"git clone git://github.com/MaxMEllon/vim-jsx-pretty
"git clone git://github.com/pangloss/vim-javascript
"git clone git://github.com/jremmen/vim-ripgrep
"git clone git://github.com/jpalardy/vim-slime
"git clone git://github.com/fatih/vim-go
"git clone git://github.com/prettier/vim-prettier

filetype plugin indent on
set ignorecase

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.css,*.json,*.md,*.yaml,*.html,*.ts,*.tsx Prettier

let s:last_go_run = ""

let g:go_fmt_command = "goimports"
let g:go_def_mode = "gopls"
let g:go_info_mode = "gopls"

" %1 is the TMUX_PANE env var (the pane ID)
let g:tmux_send = "! tmux send -t %1 "

function! g:CurrentGoSuiteTest()
  let s:last_go_run = "./..."
  call g:LastGoFileTest()
endfunc
nnoremap <leader>rs :call g:CurrentGoSuiteTest()<CR><C-L>

function! g:CurrentGoFuncTest()
  let temp = system("~/testReducer -file " . expand("%") . " -line " . line("."))
  let s:last_go_run = substitute(temp, '\n', '', 'g')
  call g:LastGoFileTest()
endfunc
nnoremap <leader>rr :call g:CurrentGoFuncTest()<CR><C-L>

function! g:LastGoFileTest()
  " :execute g:tmux_send . "'clear' Enter"
  :execute g:tmux_send . "'narf go test -failfast " . s:last_go_run . "' Enter"
endfunc
nnoremap <leader>rl :call g:LastGoFileTest()<CR><C-L>

function! g:CurrentGoFuncDelve()
  let temp = system("~/testReducer -file " . expand("%") . " -line " . line(".") . " -d")
  let s:last_dlv_run = substitute(temp, '\n', '', 'g')
  call g:LastGoFileDelve()
endfunc
nnoremap <leader>dr :call g:CurrentGoFuncDelve()<CR><C-L>

function! g:LastGoFileDelve()
  :execute g:tmux_send . "'clear' Enter"
  :execute g:tmux_send . "'dlv test " . s:last_dlv_run . "' Enter"
endfunc
nnoremap <leader>dl :call g:LastGoFileDelve()<CR><C-L>

function! g:SetDelveBreakpoint()
  :execute g:tmux_send . "'break " . expand("%") . ":" . line(".") . "' Enter"
endfunc
nnoremap <leader>db :call g:SetDelveBreakpoint()<CR><C-L>

" Configure vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": "mes:1.1"}

" New buffer at direction
nmap <leader>sh  :leftabove  vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk  :leftabove  new<CR>
nmap <leader>sj  :rightbelow new<CR>

" traverse splits
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k

" arrows resize splits
nnoremap <UP>    <C-w>+
nnoremap <DOWN>  <C-w>-
nnoremap <LEFT>  <C-w>>
nnoremap <RIGHT> <C-w><

" Ctrl-P settings
let g:ctrlp_max_height = 20
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("k")':   ['<Tab>'],
    \ }
set wildignore+=*/tmp/*,node_modules,*/static/*
set wildignorecase
nnoremap <leader>y :tabe<CR>:CtrlP<CR>
nnoremap <leader>t :CtrlP<CR>

" Checktime reloads files editted outside vim (git)
nnoremap <leader>q :checktime

" Random Leader Commands
nnoremap <leader>a :tabe\|:Rg<Space>
nnoremap <leader>A :tabe\|:Rg<Space><C-r><C-w>
nnoremap <leader>g :Git
nnoremap <leader>4 :tabclose<CR>
nnoremap <leader>. :!

" Set VIMs search to ripgrep
" set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case

" Clear highlighting
map <C-h> :nohl<cr>

" Disable Ex mode, and capital K
map Q <Nop>
map K <Nop>

" Use space to toggle folds
nnoremap <space> za

" Press Shift+P while in visual mode to replace the selection without
" overwriting the default register
vmap P p :call setreg('"', getreg('0')) <CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Set tab to 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.rabl set filetype=ruby
au BufRead,BufNewFile *.axlsx set filetype=ruby
au BufRead,BufNewFile *.hamljs set filetype=haml

autocmd FileType go setlocal noexpandtab tabstop=2 shiftwidth=2

" toggle red line at 101st character to keep lines under 80 chars
function! g:ToggleRedline()
  if(&colorcolumn == 101)
    set colorcolumn=0
  else
    set colorcolumn=101
  endif
endfunc
nnoremap <leader>l :call g:ToggleRedline()<cr>

" Function for swapping splits. Obtained from.. http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mn :call MarkWindowSwap()<CR>
nmap <silent> <leader>ms :call DoWindowSwap()<CR>
""" END SWAPPING SPLITS """


""" COC Stuff
" Use tab for trigger completion with characters ahead and navigate.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
"set updatetime=1000
"
"

" Ale stuff
let g:ale_lint_delay = 1000
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'css': ['prettier'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier', 'fixjson'],
\   'typescript': ['prettier', 'eslint'],
\}
let g:ale_completion_enabled = 1
let g:ale_completion_autoimport = 1
set omnifunc=ale#completion#OmniFunc

" https://github.com/dense-analysis/ale/issues/3373#issuecomment-701967881
" Made a modification to ale code :(

inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <leader><Tab> <C-X><C-O>
inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
