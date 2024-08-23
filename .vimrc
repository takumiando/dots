"" load plug setting
source ~/.vim-plug.vim

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
set helplang=en
set laststatus=2
set mouse=
set noshowmode
highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE

inoremap <C-e> <esc>
inoremap <C-w> <C-p>
noremap <C-f> :FZF<CR>
noremap <C-j> <C-w>W
noremap <C-k> <C-w>w
noremap <C-_> :sp<CR> <C-w>w :FZF<CR>
noremap <C-\> :vsp<CR> <C-w>w :FZF<CR>
noremap <C-g> :vsp<CR> <C-w>w :exe("GtagsCursor")<CR>
noremap <silent> <C-m> :PrevimOpen<CR>
nnoremap <C-s> :wv<CR>
nnoremap <S-s> :rv!<CR>

let g:previm_open_cmd = 'xdg-open'
let g:vim_markdown_folding_disabled=1
let g:previm_show_header = 0

augroup fileTypeIndent
	autocmd!
	autocmd BufNewFile,BufRead *.c set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab softtabstop=0
	autocmd BufNewFile,BufRead Makefile set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab softtabstop=0
	autocmd BufNewFile,BufRead *.h set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab softtabstop=0
	autocmd BufNewFile,BufRead *.dts* set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab softtabstop=0
	autocmd BufNewFile,BufRead *.py set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd BufNewFile,BufRead *.html set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
	autocmd BufNewFile,BufRead *.js set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd BufNewFile,BufRead *.sh set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd BufNewFile,BufRead *shrc set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd BufNewFile,BufRead Kconfig set tabstop=8 shiftwidth=8 softtabstop=0 noexpandtab softtabstop=0
	autocmd BufNewFile,BufRead *.css set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
    autocmd BufNewFile,BufRead *.md set filetype=markdown tabstop=4 shiftwidth=4 softtabstop=4 expandtab
	autocmd BufNewFile,BufRead * nested if @% !~ '\.' && getline(1) !~ '^#!.*sh' | set tabstop=4 shiftwidth=4 softtabstop=4 expandtab filetype=sh | endif
augroup END
