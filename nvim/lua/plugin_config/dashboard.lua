local default_banner = {
	"  ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ",
	"  ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ",
	"  ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ",
	"  ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ",
	"  ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ",
}

local rogue_banner = {
	" Welcome back to NEOVIM                                  ",
	" You hear a noise                |------|                ",
	"                                 |....>.|                ",
	"             |------|       -----|.{....+                ",
	"             |.k....+#######+.m.....|---|                ",
	"             |...@..|       |....m..|                    ",
	"             |------|       |-------|                    ",
	"                                                         ",
	"                                                         ",
}

local rogue_banner_2 = {
	" Welcome back to NEOVIM                                  ",
	" You hear a noise                                        ",
	"                                                         ",
	"              ╔════════╗                                 ",
	"              ║........║         ╔════════════╗          ",
	"              ║..@.....+░░░░░░░░░+.........$..║          ",
	"              ║.....k..║         ║.m....╔═════╝          ",
	"              ╚════════╝         ║......╚═╗              ",
	"                                 ║.......>║              ",
	"                                 ║{...m.╔═╝              ",
	"                                 ╚══════╝                ",
	"                                                         ",
	"                                                         ",
}


-- ░▒▓ │┐└─┘┌ █▄▌▐▀ ║╗╝╚╔═

-- vim.g.dashboard_default_executive = 'telescope'

local home = os.getenv('HOME')
local db = require('dashboard')

db.setup({
	theme = 'hyper',
	config = {
		header = rogue_banner_2,
		-- week_header = {
		--      enable = true,
		-- },
		shortcut = {
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Files',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
			{
				icon = ' ',
				icon_hl = '@variable',
				desc = 'Mason',
				group = 'Label',
				action = 'Mason',
				key = 'm',
			},
			{
				desc = ' Terminal',
				group = 'DiagnosticHint',
				action = 'ToggleTerm',
				key = 't',
			},
			{
				desc = ' Check Health',
				group = 'Number',
				action = 'checkhealth',
				key = 'c',
			},
		},
	},
})
