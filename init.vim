" GENERAL SETTINGS
set number						                        " Show current line number
set relativenumber					                    " Show relative line numbers
set mouse=a 						                    " Enable mouse scrolling
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent	    " Tab width
set expandtab smarttab					                " Tab key actions
set incsearch ignorecase smartcase hlsearch		        " Hightlight text while searching
set wrap breakindent                                    " Wrap long lines to the width set by tw
set encoding=utf-8                                      " Text encoding
set title                                               " Tab title as file name
set conceallevel=2                                      " Set this so we won't break indenation plugin
set tw=90                                               " Auto wrap lines that are longer than that
set emoji                                               " Enable emojis
set history=1000                                        " History limit
set showtabline=0                                       " Always show tab line

" PLUGINS

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align

Plug 'cohama/lexima.vim' " Auto close parenthenses
Plug 'tpope/vim-commentary' " Comment code
Plug 'editorconfig/editorconfig-vim' " Editor config
Plug 'github/copilot.vim' " AI pair programmer

if has("nvim") 
	Plug 'projekt0n/github-nvim-theme' " Theme
	" Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	" Syntax highlighting
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	Plug 'nvim-telescope/telescope.nvim' " fuzzy finder
	Plug 'kyazdani42/nvim-web-devicons'
endif

call plug#end()

" CUSTOM MAPPINGS

" Theme
let g:github_function_style = "italic"
let g:github_sidebars = ["qf", "vista_kind", "terminal", "packer"]

let g:github_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
colorscheme github_dark

" HOTKEYS

" The essentials
let mapleader=","
nnoremap <leader>r :source %<CR>
nnoremap <leader>q :bd<CR>
nnoremap zz :w<CR>
nnoremap zx :wq<CR>
nnoremap <leader>e :PlugInstall<CR>
nnoremap <F3> :Explore<CR>

" New line in normal mode and back
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" Navigate between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>

nnoremap <silent> ]B :blast<CR>

" switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Telescope
nnoremap <leader>ff <Cmd>Telescope find_files<CR>
nnoremap <leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <leader>fb <Cmd>Telescope buffers<CR>
nnoremap <leader>fh <Cmd>Telescope help_tags<CR>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close
			},
		},
		extensions = {
			fzf = {
				fuzzy = true,
				override_generic_sorter = true,
				override_file_sorter = true,
				case_mode = "smart_case"
			}
		},
	},
}
EOF

" Performance tweaks
set cursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=2

" Coc

set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set signcolumn=yes

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-pairs',
            \'coc-json',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-pyright',
            \'coc-clangd',
            \'coc-prettier',
            \'coc-xml',
            \'coc-syntax',
            \'coc-git',
            \'coc-marketplace',
            \'coc-highlight',
            \'coc-sh',
            \'coc-eslint',
            \'coc-emmet',
            \'coc-actions',
            \]

" Coc multi cursor highlight color
hi CocCursorRange guibg=#b16286 guifg=#ebdbb2

" Coc hotkeys
nmap <C-]> <Plug>(coc-definition)

" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
