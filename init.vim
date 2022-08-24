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
Plug 'kevinhwang91/nvim-bqf' " Quickfix

if has("nvim") 
	Plug 'projekt0n/github-nvim-theme' " Theme
	" Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Debugging
    " Plug 'puremourning/vimspector'
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'theHamsta/nvim-dap-virtual-text'

	" Syntax highlighting
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    " Toggle Terminal
    Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

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
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Toggle Terminal
nnoremap <F4> :ToggleTerm<CR>

lua << EOF
require("toggleterm").setup{
    size = 20,
    hide_numbers = true,
    windbar = {
        enable = false,
        name_formatter = function(term)
            return term.name
        end
    },
}
EOF

" Debugging
lua << EOF
-- Set up DAP
local dap = require("dap")
dap.adapters.node2 = {
 type = 'executable',
 command = 'node',
 args = {os.getenv('HOME') .. '/debugger-adapters/vscode-node-debug2/out/src/nodeDebug.js'}
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'},
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}
vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

-- Set up DAP UI
require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
  }
})

-- Set up DAP virtual text
require("nvim-dap-virtual-text").setup()
EOF

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
