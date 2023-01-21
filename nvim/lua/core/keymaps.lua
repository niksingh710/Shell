vim.g.mapleader = " "

local keymap = vim.keymap   -- for ease to type
local opts = { silent = true }
-- general mappings
keymap.set("i", "jk", "<esc>" , opts)
keymap.set("i", "kj", "<esc>" , opts)
keymap.set('i', '<c-s>', '<esc>:w!<cr>', opts)

-- keep indentations while moving lines
keymap.set('i', '<a-k>', "<esc>:m .-2<cr>==gi", opts)
keymap.set('i', '<a-j>', "<esc>:m .+1<cr>==gi", opts)


keymap.set('n', '<c-s>', ':w!<cr>', opts)
keymap.set('n', '<leader>q', ':q!<cr>', opts)
keymap.set("n", "<leader>h", ":nohl<cr>" , opts)
keymap.set("n", "x", '"_x' , opts)

-- numbers ++/--
keymap.set("n", "<leader>+", "<c-a>" , opts)
keymap.set("n", "<leader>-", "<c-x>" , opts)

-- splits
keymap.set("n", "<leader>sv", "<c-w>v", opts) -- split window vertically
keymap.set("n", "<leader>sh", "<c-w>s", opts) -- split window horizontally
keymap.set("n", "<leader>se", "<c-w>=", opts) -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<cr>", opts) -- close current split window

-- tabs setup
keymap.set("n", "<leader>to", ":tabnew<cr>", opts) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<cr>", opts) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<cr>", opts) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<cr>", opts) --  go to previous tab

-- Resize splits or buffers
keymap.set("n", "<c-s-k>", ":resize -2<cr>", opts)
keymap.set("n", "<c-s-j>", ":resize +2<cr>", opts)
keymap.set("n", "<c-s-h>", ":vertical resize -2<cr>", opts)
keymap.set("n", "<c-s-l>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
keymap.set("n", "<s-l>", ":bnext<cr>", opts)
keymap.set("n", "<s-h>", ":bprevious<cr>", opts)

-- highlightss always in center
keymap.set('n', 'n', "nzzzv", opts)
keymap.set('n', 'N', "Nzzzv", opts)

keymap.set('n', '<a-j>', ":m .+1<cr>==", opts)
keymap.set('n', '<a-k>', ":m .-2<cr>==", opts)

-- Stay in indent mode
keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)
keymap.set('v', '<a-j>', ":m '>+1<cr>gv=gv", opts)
keymap.set('v', '<a-k>', ":m '<-2<cr>gv=gv", opts)

-- Terminal --
-- Better terminal navigation
keymap.set("t", "<c-h>", "<c-\\><c-N><c-w>h", opts)
keymap.set("t", "<c-j>", "<c-\\><c-N><c-w>j", opts)
keymap.set("t", "<c-k>", "<c-\\><c-N><c-w>k", opts)
keymap.set("t", "<c-l>", "<c-\\><c-N><c-w>l", opts)

vim.cmd [[
cmap <c-j> <c-n>
cmap <c-k> <c-p>
]]

----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<cr>", opts) -- toggle split window maximization

-- nvim tree
keymap.set('n', '<leader>e', ":NvimTreeToggle<cr>", opts)

--telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", opts) -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", opts) -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts) -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts) -- list available help tags

-- telescope git commands 
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", opts) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", opts) -- list current changes per file with diff preview ["gs" for git status]
