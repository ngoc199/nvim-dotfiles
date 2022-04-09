# NVim Config Files

These are my Neovim configuration files. Feel free to fork this and modify as
you need.

## Theme

I use the `projekt0n/github-nvim-theme` dark theme. It looks clean and
comfortable for my eyes.

One more reason I use dark mode.

> Light attracts the bugs.

## Plugins

| Plugin                                   | Description                                        |
| ---------------------------------------- | -------------------------------------------------- |
| cohama/lexima.vim                        | Auto close parentheses                             |
| neoclide/coc.nvim                        | Language Server Protocol (LSP) and more extensions |
| nvim-treesitter/nvim-treesitter          | Better syntax highlighting than VSCode             |
| nvim-lua/plenary.nvim                    | Required to use Telescope                          |
| nvim-telescope/telescope-fzf-native.nvim | Fuzzy finder extension for Telescope               |
| nvim-telescope/telescope.nvim            | Find & Navigate between the files in the project   |
| kyazdani42/nvim-web-devicons             | Icons pack (require nerd fonts)                    |
| tpope/vim-commentary                     | Comment code                                       |

## Hotkeys You Love To Know

Too lazy to type the whole things to the commands? Don't want to do repeat task?

Then try to use these hotkeys to make your life easier.

| Hotkey     | What it does                  | Description                           |
| ---------- | ----------------------------- | ------------------------------------- |
| ,          | <leader>                      | Don't need to reach that far          |
| <leader>r  | :source %<CR>                 | Reload the config files               |
| <leader>q  | :bd<CR>                       | Delete the buffer                     |
| zz         | :w<CR>                        | Save file                             |
| zx         | :wq<CR>                       | Save file and quit                    |
| <leader>e  | :PlugInstall<CR>              | Install Plugins                       |
| <Enter>    | o<ESC>                        | Enter new line below in `normal` mode |
| <S-Enter>  | O<ESC>                        | Enter new line above in `normal` mode |
| [b         | :bprevious<CR>                | Move to previous buffer               |
| ]b         | :bnext<CR>                    | Move to next buffer                   |
| [B         | :bfirst<CR>                   | Move to the first buffer              |
| ]B         | :blast<CR>                    | Move to the last buffer               |
| <C-hjkl>   | <C-w>hjkl                     | Navigate between splits               |
| <leader>ff | <Cmd>Telescope find_files<CR> | Find files in the project             |
| <leader>fb | <Cmd>Telescope buffers<CR>    | Find buffers                          |
| <leader>fh | <Cmd>Telescope help_tags<CR>  | Find help tags                        |
| gcc        |                               | Comment out a line                    |
| gcc        |                               | Comment out a target of a motion      |

## Connect With Me

I am Ngoc Nguyen. I am glad to add another fellow developer to my network.
Connect with me here:

- [twitter](https://twitter.com/ngocoder)
- [Linkedin](https://www.linkedin.com/in/ngoc-nguyen99/)
