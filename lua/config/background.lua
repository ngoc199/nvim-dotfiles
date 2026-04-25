local groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"FloatBorder",
	"SignColumn",
	"FoldColumn",
	"StatusLine",
	"StatusLineNC",
	"Pmenu",
	"PmenuSel",
	"PmenuSbar",
	"PmenuThumb",
	"LineNr",
	"CursorLineNr",
	"EndOfBuffer",
	"MsgArea",
}

for _, group in ipairs(groups) do
	vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
end
