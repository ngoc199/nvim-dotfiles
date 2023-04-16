# NeoVim Config Files

These are my Neovim configuration files. Feel free to fork this and modify as you need.

All the files are written in [lua language](https://www.lua.org/).

## Dependencies

Before using this Neovim configuration, these dependencies must be installed:

- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [fzf - fuzzy finder](https://github.com/junegunn/fzf)
- [Packer - plugin manager](https://github.com/wbthomason/packer.nvim)
- [NodeJS](https://nodejs.org/en/) or [nvm](https://github.com/nvm-sh/nvm) to install Node
- [Nerd Fonts](https://www.nerdfonts.com/) for the best experience
- [Prettierd](https://github.com/fsouza/prettierd) for formatting

## Theme

I use the [projekt0n/github-nvim-theme](https://github.com/projekt0n/github-nvim-theme) dark theme. It looks clean and comfortable for my eyes.

One more reason I use dark mode.

> Light attracts the bugs.

## Plugins

| Plugin                                   | Description                                        |
| ---------------------------------------- | -------------------------------------------------- |
| cohama/lexima.vim                        | Auto close parentheses                             |
| VonHeikemen/lsp-zero.nvim                | Language Server Protocol (LSP)                     |
| nvim-treesitter/nvim-treesitter          | Better syntax highlighting than VSCode             |
| nvim-lua/plenary.nvim                    | Required to use Telescope                          |
| nvim-telescope/telescope-fzf-native.nvim | Fuzzy finder extension for Telescope               |
| nvim-telescope/telescope.nvim            | Find & Navigate between the files in the project   |
| kyazdani42/nvim-web-devicons             | Icons pack (require nerd fonts)                    |
| tpope/vim-commentary                     | Comment code                                       |
| editorconfig/editorconfig-vim            | Editor Config                                      |
| mhartington/formatter.nvim               | File Formatter                                     |
| airblade/vim-gitgutter                   | Show `git diff` (changes) of a file                |

## Hotkeys You Love To Know

Too lazy to type the whole things to the commands? Don't want to do repeat task?

Then try to use these hotkeys to make your life easier.

| Hotkey     | What it does                  | Description                                  |
| ---------- | ----------------------------- | ---------------------------------------------|
| ,          | <leader>                      | Don't need to reach that far                 |
| <leader>r  | :source %<CR>                 | Reload the config files                      |
| <leader>q  | :bd<CR>                       | Delete the buffer                            |
| zz         | :w<CR>                        | Save file                                    |
| zx         | :wq<CR>                       | Save file and quit                           |
| <leader>e  | :PlugInstall<CR>              | Install Plugins                              |
| <Enter>    | o<ESC>                        | Enter new line below in `normal` mode        |
| <S-Enter>  | O<ESC>                        | Enter new line above in `normal` mode        |
| [b         | :bprevious<CR>                | Move to previous buffer                      |
| ]b         | :bnext<CR>                    | Move to next buffer                          |
| [B         | :bfirst<CR>                   | Move to the first buffer                     |
| ]B         | :blast<CR>                    | Move to the last buffer                      |
| <C-hjkl>   | <C-w>hjkl                     | Navigate between splits                      |
| <leader>ff | <Cmd>Telescope find_files<CR> | Find files in the project                    |
| <leader>ff | <Cmd>Telescope find_files<CR> | Search text in the project                   |
| <leader>fb | <Cmd>Telescope buffers<CR>    | Find buffers                                 |
| <leader>fh | <Cmd>Telescope help_tags<CR>  | Find help tags                               |
| <leader>fm | <Cmd>Format<CR>               | Format the file                              |
| <leader>fM | <Cmd>FormatWrite<CR>          | Format and save the file                     |
| <leader>db | dap.toggle_breakpoint         | Toggle breakpoint                            |
| <F5>       | dap.continue                  | Start a new debug session / Continue debug session |
| <F6>       | dap.step_over                 | Step over in debug session                   |
| <F7>       | dap.step_into                 | Step into in debug session                   |
| <F8>       | dap.step_out                  | Step out in debug session                    |
| gcc        | vim-commentary default        | Comment out a line                           |
| gcc        | vim-commentary default        | Comment out a target of a motion             |
| <C-]>      | vim.lsp.buf.definition        | Jump to definition                           |
| <F3>       | :Explore<CR>                  | Open Netrw                                   |
| <leader>a  | vim.lsp.buf.code_action       | Open quick actions                           |
| gn         | vim.diagnostic.goto_next      | Go to next diagnostic                        |
| gb         | vim.diagnostic.goto_prev      | Go to previous diagnostic                    |

## Connect With Me

I am Ngoc Nguyen. I am glad to add another fellow developer to my network.
Connect with me here:

- [twitter](https://twitter.com/ngocoder)
- [Linkedin](https://www.linkedin.com/in/ngoc-nguyen99/)
