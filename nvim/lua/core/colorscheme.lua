local status_ok, plugin = pcall(require, "tokyonight")
if not status_ok then
  vim.notify("Tokyonight plugins is not available!!")
	return
end

plugin.setup({
	transparent = true,
	styles = {
		sidebars = "transparent",
		-- floats = "transparent",
	},
	on_highlights = function(hl, colors)
		hl.CursorLineNr = {
			fg = colors.fg,
			-- bg = colors.black,
		}
		hl.CursorColumn = {
			bg = colors.bg,
		}
    hl.NvimTreeIndentMarker = {
      fg = colors.fg,
    }
	end,
})

local status, _ = pcall(vim.cmd, "colorscheme tokyonight-storm")
if not status then
  vim.notify("Colorscheme not found!! <tokyonight>")
  return
end

