-- GLOBALS
vim.g.closetag_xhtml_filetypes = "xhtml,javascript.jsx,jsx" -- Enable Auto Tag closing in JSX
vim.cmd([[autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx]])
vim.cmd([[autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx]])

-- OPTIONS
vim.opt.number = true                      -- Show line number in Gutter
vim.opt.mouse = "a"                        -- Allow mouse functionality
vim.opt.ignorecase = true                  -- Ignore uppercase letters when searching
vim.opt.smartcase = true                   -- Make search ignore uppercase letters unless term has uppercase
vim.opt.hlsearch = false                   -- Highlights the results of the previous search
vim.opt.wrap = false                       -- Make long lines always visible by wrapping to next line
vim.opt.breakindent = true                 -- Preserve indentation of virtual lines (lines that are wrapped)
vim.opt.tabstop = 2                        -- The amount of space a Tab character can occupy
vim.opt.shiftwidth = 2                     -- Amount of characters Neovim will use to indent a line.
vim.opt.expandtab = false                  -- Controls whether or not Neovim should transform a Tab character to spaces.
vim.opt.visualbell = true                  -- Use visual bell instead of beeping
vim.opt.undodir = ".vim/undoBufferHistory" -- Set undo buffer history location
vim.opt.completeopt = "noinsert,menuone,noselect"

-- KEYBINDINGS
vim.g.mapleader = " "                                                                                            -- LEADER KEY
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })                                            -- Save buffer
vim.keymap.set({ "n", "x" }, "cp", '"+y')                                                                        -- Copy to clipboard
vim.keymap.set({ "n", "x" }, "cv", '"+p')                                                                        -- Paste from clipboard
vim.keymap.set({ "n", "x" }, "x", '"_x')                                                                         -- Delete text without changing the internal registers
vim.keymap.set({ "n", "x" }, "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Neovim Tree" })            -- Toggle Neovim Tree
vim.keymap.set({ "n", "x", "t" }, "<leader>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })              -- Toggle Terminal
vim.keymap.set({ "n", "x" }, "<leader>m", "<cmd>TroubleToggle<cr>", { desc = "Toggle Trouble Bar" })             -- Toggle Trouble
vim.keymap.set({ "n", "x" }, "<leader>u", "<cmd>UndotreeToggle<cr>", { desc = "Toggle Undo Tree" })              -- Toggle Undo Tree
vim.keymap.set({ "n", "x" }, "<leader>lf", "<cmd>Neoformat<cr>", { desc = "Format Document" })
vim.keymap.set({ "n", "x" }, "<leader>n", "<cmd>BufferLineCycleNext<cr>", { desc = "Cycle To Next Buffer" })     -- Go to Next Buffer
vim.keymap.set({ "n", "x" }, "<leader>p", "<cmd>BufferLineCyclePrev<cr>", { desc = "Cycle To Previous Buffer" }) -- Go to Previous Buffer
vim.keymap.set(
	"n",
	"<Leader>f",
	'<cmd>lua require("telescope.builtin").find_files()<CR>',
	{ noremap = true, silent = true }
)

-- COMMANDS
vim.cmd("set undofile") -- Persist undo actions even after closing buffer
vim.api.nvim_create_user_command("ReloadConfig", "source $MYVIMRC", { desc = "Reload config" })

-- PLUGIN MANAGER
local lazy = {}

function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)
	require("lazy").setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {}

lazy.setup({
	-- THEMES
	{ "pineapplegiant/spaceduck" },
	{ "rose-pine/neovim",        name = "rose-pine" },

	-- UTILS
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			{ "neovim/nvim-lspconfig" },
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	},                                                          -- LSP
	{ "williamboman/mason.nvim" },                              -- LSP, Formatter, Linter manager
	{ "williamboman/mason-lspconfig.nvim" },                    -- Simple Lsp Settings
	{ "sbdchd/neoformat" },                                     -- Formatter
	{ "f-person/auto-dark-mode.nvim" },                         -- Auto Dark Mode on Mac
	{ "akinsho/toggleterm.nvim",          version = "*", config = true }, -- Terminal Window
	{ "alvan/vim-closetag" },                                   -- HTML Tag Clozer
	{ "numToStr/Comment.nvim" },                                -- Comment Toggle
	{ "jiangmiao/auto-pairs" },                                 -- Automatic Tag Clozer
	{ "alvan/vim-closetag" },
	{ "mbbill/undotree" },                                      -- Undo Tree
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},                                    -- Key commands display
	{ "nvim-treesitter/nvim-treesitter" }, -- Language Highlights & Parsing
	{ "folke/trouble.nvim" },
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- UI
	{ "ap/vim-css-color" },                   -- Display CSS colors
	{ "lewis6991/gitsigns.nvim" },            -- Show git information in buffer
	{ "nvim-lualine/lualine.nvim" },          -- Bottom Line
	{ "yuttie/comfortable-motion.vim" },      -- Smooth scroll
	{ "lukas-reineke/indent-blankline.nvim" }, -- Indent Guide
	{ "nvim-tree/nvim-web-devicons" },        -- Icons
	{ "nvim-tree/nvim-tree.lua" },            -- File Explorer
	{ "akinsho/bufferline.nvim",            version = "*" },
})

-- PLUGIN CONFIGS --

----------------------------------------------------------------

-- LSP
local lsp = require("lsp-zero").preset({})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<cr>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
})

lsp.setup_nvim_cmp({ mapping = cmp_mappings })

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

-- (Optional) Configure lua language server for neovim
require("lspconfig").lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

----------------------------------------------------------------

-- BUFFERLINE

require("bufferline").setup()

----------------------------------------------------------------

-- GITSIGNS
require("gitsigns").setup({
	signs = {
		add = { text = "▎" },
		change = { text = "▎" },
		delete = { text = "➤" },
		topdelete = { text = "➤" },
		changedelete = { text = "▎" },
	},
})

----------------------------------------------------------------

-- COMMENT.NVIM
require("Comment").setup({})

----------------------------------------------------------------

-- WHICH KEY
require("which-key").setup()

----------------------------------------------------------------

-- TREESITTER
require("nvim-treesitter.configs").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	sync_install = false,
	auto_install = true,
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"css",
		"json",
		"lua",
		"html",
		"c",
		"cpp",
		"rust",
	},
})

----------------------------------------------------------------

-- MASON
require("mason").setup()

----------------------------------------------------------------

-- LUALINE
require("lualine").setup({
	options = {
		icons_enabled = true,
		section_separators = "",
		component_separators = "|",
	},
})

-----------------------------------------------------------------

-- NVIM TREE
-- Disable Netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Setup Using Config
require("nvim-tree").setup({
	view = { width = 30 },
	renderer = {
		group_empty = true,
		highlight_git = true,
	},
	respect_buf_cwd = true,
	prefer_startup_root = true,
	sync_root_with_cwd = true,
})

----------------------------------------------------------------

-- COMFORTABLE MOTION
vim.g.comfortable_motion_friction = 100.0
vim.g.comfortable_motion_air_drag = 2.0

----------------------------------------------------------------

-- TOGGLE TERMINAL
require("toggleterm").setup({
	-- direction = "float",
	-- shading_factor = -50,
})

----------------------------------------------------------------

-- AUTO CLOSE TAG

----------------------------------------------------------------

-- AUTO-DARK-MODE (CHANGE THEME ON MACOS)
if vim.loop.os_uname().sysname == "Darwin" then
	local auto_dark_mode = require("auto-dark-mode")

	auto_dark_mode.setup({
		update_interval = 1000,
		set_dark_mode = function()
			vim.api.nvim_set_option("background", "dark")
			vim.cmd.colorscheme("rose-pine")
		end,
		set_light_mode = function()
			vim.api.nvim_set_option("background", "light")
			vim.cmd.colorscheme("rose-pine")
		end,
	})
	auto_dark_mode.init()
end

----------------------------------------------------------------

-- THEMING
vim.opt.termguicolors = true     -- Enable Terminal colors
vim.cmd.colorscheme("rose-pine") -- Set Theme

----------------------------------------------------------------
