set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

set clipboard+=unnamedplus

nnoremap <Leader>c :if &clipboard == "unnamedplus" <Bar> set clipboard= <Bar> echo "Clipboard Sync OFF" <Bar> else <Bar> set clipboard=unnamedplus <Bar> echo "Clipboard Sync ON" <Bar> endif<CR>

if !empty($SSH_CLIENT) || !empty($SSH_TTY)
  lua << EOF
  if vim.fn.has('nvim-0.10') == 1 then
    vim.g.clipboard = {
      name = 'OSC 52',
      copy = {
        ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
        ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
      },
      paste = {
        ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
        ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
      },
    }
  end
EOF
endif
