return {
	-- nvim-treesitter configuration
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		build = ":TSUpdate",
		config = function()
			local treesitter = require("nvim-treesitter.configs")
			treesitter.setup({
				highlight = {
					enable = true,
				},
				indent = { enable = true },
				-- NOTE: The 'autotag' option here is removed or commented out
				-- because nvim-ts-autotag now handles its own setup entirely.
				-- autotag = {
				--   enable = true, -- REMOVE OR COMMENT OUT THIS BLOCK
				-- },
				ensure_installed = {
					"json",
					"javascript",
					"typescript",
					"tsx",
					"vue",
					"yaml",
					"html",
					"css",
					"prisma",
					"markdown",
					"markdown_inline",
					"svelte",
					"graphql",
					"bash",
					"lua",
					"vim",
					"dockerfile",
					"gitignore",
					"query",
					"vimdoc",
					"c",
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
	-- nvim-ts-autotag configuration
	{
		"windwp/nvim-ts-autotag",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup({
				opts = {
					enable_close = true,
					enable_rename = true,
					enable_close_on_slash = true, -- Or false, depending on preference
				},
				filetypes = {
					"html",
					"javascript", -- **** ADDED/ENSURED THIS LINE ****
					"javascriptreact", -- Keep this for .jsx files or if ft changes
					"tsx",
					"typescriptreact",
					"svelte",
					"vue",
					"xml",
					-- any other filetypes where you want autotagging
				},
				-- You can also specify excluded filetypes if needed
				-- excluded_filetypes = {"markdown"}
			})
			print("nvim-ts-autotag setup called for javascript filetype handling")
		end,
	},
}
