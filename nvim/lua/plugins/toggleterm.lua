-- Toggle Terminal
local ok, plugin = pcall(require, "toggleterm")
if not ok then
	vim.notify(plugin, vim.log.levels.ERROR)
	return
end
plugin.setup({
	active = true,
	on_config_done = nil,
	size = 20,
	open_mapping = [[<c-,>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	start_in_insert = true,
	insert_mappings = true,
	persist_size = false,
	direction = "float",
	close_on_exit = true, -- close the terminal window when the process exits
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
