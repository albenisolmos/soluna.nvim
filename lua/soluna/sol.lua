local cmd = vim.cmd
local settings = require("soluna").settings
local utils = require("soluna.utils")
local hi = utils.hi
local link = utils.link

cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	cmd("syntax reset")
end

local colors = {
	base = "#212121",
	surface = "#222222",
	relief = "#292929",
	highlight = "#228ae7",
	normal = "#ab9c86",
	grey = "#222222",
	grey_50 = "#292929",
	grey_100 = "#303030",
	grey_200 = "#626262",
	grey_300 = "#909090",
	red = "#D65E5F",
	red_2 = "#d64344",
	red_3 = "#af5f5f",
	orange = "#D7875F",
	cyan = "#689984",
	violet = "#B16286",
	yellow = "#ffad57",
	green = "#98971a",
}

-- Editor settings
hi("Normal", colors.grey_300)
hi("NormalFloat", nil, colors.relief)
hi("FloatBorder", colors.relief, colors.relief)
hi("FloatShadow", nil, "#101010", { blend = 30 })
--hl('FloatShadowThrough', nil, '#202020', {blend=30})

-- Cursor
hi("Cursor", nil, colors.red)
hi("CursorLine", nil, colors.surface)
hi("CursorLineNr", colors.grey_300)
hi("LineNr", colors.grey_100)

-- Number column
hi("CursorColumn")
hi("Folded", nil, nil)
hi("FoldColumn", colors.grey_200, colors.base)
hi("SignColumn", colors.grey_200)
hi("SignatureMarkText", colors.grey_200, colors.base)

-- - Window/Tab delimiters -
hi("VertSplit", colors.surface, "none")
link("WinSeparator", "VertSplit")
hi("ColorColumn", nil, colors.grey_100)
hi("TabLine", colors.grey_200, "none")
hi("TabLineSel", colors.grey_300, "none", { bold = true, underline = true })
hi("TabLineFill", colors.grey_200, "none")

-- File Navigation / Searching -
hi("Directory", colors.yellow)
hi("Search", nil, "#353e46")
hi("IncSearch", nil, "#353e46")

-- Prompt/Status
hi("StatusLine", colors.grey_200, colors.surface)
hi("StatusLineNc", colors.grey_100, colors.surface)
link("StatusLineTerm", "StatusLine")
link("StatusLineTermNc", "StatusLineNc")
hi("WildMenu", colors.highlight, colors.surface)
link("MoreMsg", "MsgArea")

if settings.style_msgarea then
	hi("MsgArea", nil, colors.surface)
	hi("MoreMsg", nil, colors.surface)
else
	link("MsgArea", "Normal")
end

link("Title", "Keyword")
link("Question", "Normal")

-- Visual aid -
hi("DoMatchParen", nil, colors.grey_100)
hi("MatchParen", nil, colors.grey_100)
hi("Visual", nil, "#284566")
hi("VisualNOS", nil, "#284566")
hi("NonText", colors.grey_100)

hi("TODO", colors.base, colors.yellow)
hi("Underlined", nil, nil, { underline = true })
hi("Error", nil, nil, { underline = true })
hi("ErrorMsg", colors.red)
hi("WarningMsg", nil, colors.yellow)
hi("Ignore", nil, "#262626")
hi("SpecialKey", colors.grey_100)

-- Variable types
hi("Constant", colors.violet)
hi("String", colors.green)
hi("StringDelimiter", "#228ae7")
hi("Character", "#77961a")
hi("Number", colors.violet)
hi("Boolean", colors.violet)
hi("Float", colors.violet)
hi("Identifier", colors.normal, nil)
hi("Function", colors.yellow)

-- Language constructs
hi("Statement", colors.red)
hi("Conditional", colors.red)
hi("Repeat", colors.red)
hi("Label", colors.cyan)
hi("Operator", colors.red_3)
hi("Keyword", colors.red_2)
hi("Exception", colors.red)
hi("Comment", colors.grey_200)
hi("Special", colors.red_3)
hi("SpecialChar", "#228ae7")
-- TODO
hi("Tag", colors.red)
hi("Delimiter", colors.grey_200)
hi("SpecialComment", colors.grey_200, nil, { underline = true })
hi("Debug", colors.red)

-- C like
hi("PreProc", colors.red_2)
hi("Include", colors.red_2)
hi("Define", colors.grey_100)
hi("Macro", colors.red_2)
hi("PreCondit", colors.red_2)

hi("Type", colors.orange, nil, { bold = true })
hi("StorageClass", colors.red_2)
hi("Structure", colors.red)
hi("Typedef", colors.grey_100)

-- Diff
hi("DiffAdd", colors.green)
hi("DiffChange", colors.yellow)
hi("DiffDelete", colors.red)
hi("DiffText", colors.grey_300)

-- Completion menu
link("Pmenu", "NormalFloat")
hi("PmenuSel", "#353535")
hi("PmenuSBar", colors.red, colors.grey_200)
hi("PmenuThumb", colors.red, colors.grey_100)

-- Spelling
hi("SpellBad", colors.red, nil, { underline = true })
hi("SpellRare", nil, nil, { underline = true })
link("SpellCap", "SpellRare")
link("SpellLocal", "SpellRare")

-- Specific settings
link("FloatermBorder", "FloatBorder")
link("Floaterm", "NormalFloat")

-- Links
hi("CmpItemAbbrMatch", nil, nil, { bold = true })
link("CmpItemAbbrMatchFuzzy", "CmpItemAbbrMatch")
link("PmenuSel", "User1")
link("@tag.attribute", "Operator")
hi("iCursor", nil, colors.yellow)
hi("vCursor", nil, colors.violet)

-- Telescope
link("TelescopeNormal", "NormalFloat")
link("TelescopeBorder", "FloatBorder")
link("TelescopePromptCounter", "Comment")
hi("TelescopeTitle", "#999999", nil, { bold = true })
hi("TelescopeSelection", colors.highlight, "#28323e")

local colors_for_modes = {
	n = colors.grey_200,
	i = colors.yellow,
	v = colors.violet,
	c = colors.violet,
}

vim.api.nvim_create_autocmd("ModeChanged", {
	callback = function()
		local mode = vim.api.nvim_get_mode().mode
		--hi("ModeMsg", colors_for_modes[mode] or colors_for_modes["n"])
	end,
})
