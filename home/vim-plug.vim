let s:plug_url       = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
let s:vim_plug_path  = expand('~/.vim/autoload/plug.vim')
let s:nvim_plug_path = expand('~/.local/share/nvim/site/autoload/plug.vim')
let s:need_plug_install = 0

if empty(glob(s:vim_plug_path))
  silent execute '!curl -fLo '
    \ . shellescape(s:vim_plug_path)
    \ . ' --create-dirs '
    \ . shellescape(s:plug_url)
  let s:need_plug_install = 1
endif

if empty(glob(s:nvim_plug_path))
  silent execute '!curl -fLo '
    \ . shellescape(s:nvim_plug_path)
    \ . ' --create-dirs '
    \ . shellescape(s:plug_url)
  let s:need_plug_install = 1
endif

if s:need_plug_install
  augroup VimPlugAutoInstall
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.vim/plugged')

Plug 'chrisbra/Colorizer'
Plug 'editorconfig/editorconfig-vim'
Plug 'ficd0/ashen.nvim'
Plug 'github/copilot.vim'
Plug 'junegunn/fzf.vim'
Plug 'previm/previm'
Plug 'vim-scripts/gtags.vim'

call plug#end()
