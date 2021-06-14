"" load plug setting
source ~/.vim-plug
colorscheme wal

"" tmux setting 
augroup titlesettings
	autocmd!
	autocmd BufEnter * call system("tmux rename-window " . "'[vim] " . expand("%:t") . "'")
	autocmd VimLeave * call system("tmux rename-window zsh")
    autocmd BufEnter * let &titlestring = ' ' . expand("%:t")
augroup END

set number
set cursorline
set ruler
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding =utf-8
set cindent

set list
set listchars=tab:▸\ ,trail:▒,extends:❯,precedes:❮

set ignorecase
set smartcase
set showmatch

set confirm
set hidden
set autoread
set noswapfile
set nobackup

set showcmd

set wildmenu wildmode=list:longest,full
set history=10000

set helplang=jp

highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

imap <C-j> <esc>
imap <C-f> <C-x><C-o>
imap <C-w> <C-p>
noremap <S-x> :vsp<CR>
noremap <S-c> :sp<CR>
nnoremap <C-g> :vsp<CR> :exe("GtagsCursor")<CR>
nnoremap <C-h> :sp<CR> :exe("GtagsCursor")<CR>
nnoremap <C-s> :wv<CR>
nnoremap <S-s> :rv!<CR>

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.c set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab softtabstop=0
	autocmd BufNewFile,BufRead *.h set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab softtabstop=0
	autocmd BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	autocmd BufNewFile,BufRead *.js set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd BufNewFile,BufRead *.sh set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd BufNewFile,BufRead * nested if @% !~ '\.' && getline(1) !~ '^#!.*sh' | set tabstop=4 shiftwidth=4 softtabstop=4 expandtab filetype=sh | endif
augroup END

nnoremap <silent> <C-m> :PrevimOpen<CR>
let g:previm_open_cmd = 'surf'
let g:vim_markdown_folding_disabled=1
au BufRead,BufNewFile *.md set filetype=markdown
