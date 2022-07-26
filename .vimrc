set nocompatible

call plug#begin()

Plug 'Valloric/YouCompleteMe'
Plug 'sheerun/vim-polyglot'
Plug 'nvie/vim-flake8'
Plug 'ambv/black'
Plug 'preservim/nerdtree'
Plug 'posva/vim-vue'
Plug 'timakro/vim-yadi'
Plug 'phanviet/vim-monokai-pro'

call plug#end()
let g:ycm_clangd_binary_path='/opt/homebrew/opt/llvm/bin/clangd'

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support

python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1
syntax on

" Nerd tree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-n> :NERDTreeFocus<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']

set rnu

"Try to auto detect and use the indentation of a file when opened. 
autocmd BufRead * DetectIndent

" Otherwise use file type specific indentation. E.g. tabs for Makefiles
" and 4 spaces for Python. This is optional.
filetype plugin indent on

" Set a fallback here in case detection fails and there is no file type
" plugin available. You can also omit this, then Vim defaults to tabs.
set expandtab shiftwidth=4 softtabstop=4

" You stay in control of your tabstop setting.
set tabstop=4

autocmd BufRead,BufNewFile *.vue setfiletype html
autocmd BufWritePost *.py call Flake8()


" Always show sign column (for gitgutter)
set signcolumn=yes

set termguicolors
colorscheme monokai_pro

let g:lightline = {
	      \ 'colorscheme': 'monokai_pro',
      \ }
