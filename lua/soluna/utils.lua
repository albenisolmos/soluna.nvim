local api = vim.api
local M = {}

function M.hi(group, fg, bg, attr)
	if attr then
		api.nvim_set_hl(0, group, vim.tbl_extend("keep", { fg = fg, bg = bg }, attr))
	else
		api.nvim_set_hl(0, group, { fg = fg, bg = bg })
	end
end

function M.link(group, link_group)
	api.nvim_set_hl(0, group, { link = link_group })
end

return M
