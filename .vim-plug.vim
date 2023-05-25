if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
	  \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/gtags.vim'
Plug 'dylanaraps/fff.vim'
Plug 'dylanaraps/wal.vim'
Plug 'previm/previm'
Plug 'sotte/presenting.vim'
Plug 'itchyny/lightline.vim'

" For ddc complementation
Plug 'vim-denops/denops.vim'
Plug 'Shougo/pum.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc.vim'
Plug 'Shougo/ddc-ui-native'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-file'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'Shougo/ddc-converter_remove_overlap'
Plug 'editorconfig/editorconfig-vim'

call plug#end()
