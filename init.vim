" GENERAL SETTINGS
set number						                        " Show current line number
set relativenumber					                    " Show relative line numbers
set mouse=a 						                    " Enable mouse scrolling
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent	    " Tab width
set expandtab smarttab					                " Tab key actions
set incsearch ignorecase smartcase hlsearch		        " Hightlight text while searching
set wrap breakindent                                    " Wrap long lines to the width set by tw
set linebreak
set nolist
set encoding=utf-8                                      " Text encoding
set title                                               " Tab title as file name
set conceallevel=2                                      " Set this so we won't break indenation plugin
set tw=0                                                " Auto wrap lines that are longer than that
set emoji                                               " Enable emojis
set history=1000                                        " History limit
set showtabline=0                                       " Always show tab line

" WSL2 to Windows Clipboard
if has('wsl')
    let g:clipboard = {
                \   'name': 'WslClipboard',
                \   'copy': {
                \      '+': 'clip.exe',
                \      '*': 'clip.exe',
                \    },
                \   'paste': {
                \      '+': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \      '*': 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
                \   },
                \   'cache_enabled': 0,
                \ }
endif

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

    " Debugging
    " Plug 'puremourning/vimspector'
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'

	" Syntax highlighting
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Toggle Terminal
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

    " LSP Config
    Plug 'neovim/nvim-lspconfig'

    " Autocomplete
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'

    " Version Control
    Plug 'mhinz/vim-signify'

    " Formatting
    Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }

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

" Toggle transparent background in Vim
let t:is_transparent = 0
function! Toggle_transparent()
    if t:is_transparent == 0
        hi Normal guibg=NONE ctermbg=NONE
        let t:is_transparent = 1
    else
        set background=dark
        let t:is_transparent = 0
    endif
endfunction

nnoremap <C-t> :call Toggle_transparent()<CR>

" HOTKEYS

" The essentials
let mapleader=","
nnoremap <leader>r :source %<CR>
nnoremap <leader>q :bd<CR>
nnoremap zz :w<CR>
nnoremap zx :wq<CR>
nnoremap <leader>e :PlugInstall<CR>
nnoremap <F3> :Explore<CR>
nnoremap <S-k> :m .-2<CR>
nnoremap <S-j> :m .+1<CR>
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

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

" Switch to normal mode in Terminal
tnoremap <Esc> <C-\><C-n>

" Telescope
nnoremap <leader>ff <Cmd>Telescope find_files<CR>
nnoremap <leader>fg <Cmd>Telescope live_grep<CR>
nnoremap <leader>fb <Cmd>Telescope buffers<CR>
nnoremap <leader>fh <Cmd>Telescope help_tags<CR>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
    pickers = {
        find_files = {
            hidden = true
        }
    },
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

" Toggle Terminal
nnoremap <F4> :ToggleTerm<CR>
lua require('toggleTerm')

" Debugging
lua require('debugging')
nnoremap <silent> <S-F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <S-F7> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <S-F8> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <S-F9> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <Leader>b <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
nnoremap <silent> <Leader>da <Cmd>lua require'debugHelper'.attach()<CR>
nnoremap <silent> <Leader>do <Cmd>lua require'dapui'.open()<CR>
nnoremap <silent> <Leader>dc <Cmd>lua require'dapui'.close()<CR>

" LSP
lua require('lsp')

" Version Control
set updatetime=100

" Formatting
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
