-- clipboard and undo dir
vim.opt.clipboard:append("unnamedplus")
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

local options = {
	-- line numbers
	relativenumber = true,
	number = true,

	-- tabs & indent
	tabstop = 2,
	shiftwidth = 2,
	expandtab = true,
	autoindent = true,

	-- line wrapping
	wrap = false,

	-- search settings
	ignorecase = true,
	smartcase = true,
	incsearch = true,

	-- cursorline
	cursorline = true,
	scrolloff = 999,

	-- appearance
	termguicolors = true,
	background = "dark",
	signcolumn = "yes",

	-- backspace & undo
	backspace = "indent,eol,start",
	undofile = true,

	-- split
	splitright = true,
	splitbelow = true,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- hello-hi is a single word
vim.opt.iskeyword:append("-")
