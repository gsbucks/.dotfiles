execute pathogen#infect()

set nocompatible
filetype off
syntax enable
set mouse=""

" Set , to be leader key
let mapleader = ","

set background=dark
colorscheme solarized
set guifont=AndaleMono:h14
set guioptions-=T
set hlsearch
set backspace=2

set clipboard=unnamed

" Dont ask to re-read files changed outside vim
set autoread

set relativenumber
set number

" original repos on github
"git clone git://github.com/tpope/vim-pathogen
"git clone git://github.com/tpope/vim-fugitive
"git clone git://github.com/tpope/vim-surround
"git clone git://github.com/tpope/vim-unimpaired
"git clone git://github.com/tpope/vim-repeat
"git clone git://github.com/tpope/vim-rails
"git clone git://github.com/mileszs/ack.vim
"git clone git://github.com/scrooloose/nerdcommenter
"git clone git://github.com/ervandew/supertab
"git clone git://github.com/kien/ctrlp.vim
"git clone git://github.com/thoughtbot/vim-rspec
"git clone git://github.com/godlygeek/tabular
"git clone git://github.com/tpope/vim-eunuch

filetype plugin indent on
set ignorecase

" Configure vim-rspec
let s:rspec_tmux_command = "tmux send -t primary.0 'rspec --drb {spec}' Enter" 
let g:rspec_command = "!echo " . s:rspec_tmux_command . " && " . s:rspec_tmux_command
nnoremap <leader>rr :silent call RunNearestSpec()<CR><c-L>
nnoremap <leader>rf :silent call RunCurrentSpecFile()<CR><c-L>
nnoremap <leader>rl :silent call RunLastSpec()<CR><c-L>

" Configure vim-slime
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":2.1"}

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
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("k")':   ['<Tab>'],
    \ }
set wildignore+=*/tmp/*
nnoremap <leader>y :tabe<CR>:CtrlP<CR>
nnoremap <leader>t :CtrlP<CR>

" Checktime reloads files editted outside vim (git)
nnoremap <leader>q :checktime

" Toggle line number Ctrl-N
nmap <C-N><C-N> :set invnumber<CR>

command Wipetabs :%s/	/  /g

" Random Leader Commands
nnoremap <leader>W :Wipetabs
nnoremap <leader>a :tabe\|:Ack 
nnoremap <leader>g :Git
nnoremap <leader>4 :tabclose<CR>
nnoremap <leader>. :! 
nnoremap <leader>{ :Tabularize /{

" Clear highlighting
map <C-h> :nohl<cr>

" Disable Ex mode, and capital K
map Q <Nop>
map K <Nop>

nnoremap ; :

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
set expandtab
au FileType html setlocal shiftwidth=2 tabstop=2
au FileType javascript setlocal shiftwidth=2 tabstop=2
au FileType coffee setlocal shiftwidth=2 tabstop=2
au FileType cucumber setlocal shiftwidth=2 tabstop=2
au FileType ruby setlocal shiftwidth=2 tabstop=2
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.rabl set filetype=ruby
au BufRead,BufNewFile *.axlsx set filetype=ruby
au BufRead,BufNewFile *.hamljs set filetype=haml

" toggle red line at 101st character to keep lines under 80 chars
function! g:ToggleRedline()
  if(&colorcolumn == 101)
    set colorcolumn=0
  else
    set colorcolumn=101
  endif
endfunc
nnoremap <leader>l :call g:ToggleRedline()<cr>

" Populate args list with files in the quickfix window. Obtained from.. http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

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
