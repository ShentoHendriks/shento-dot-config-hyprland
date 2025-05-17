-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  hl_override = {
    ["@tag"] = {
      fg = "red",
    },
    ["@tag.attribute"] = {
      fg = "#E5BD7B",
    },
    ["@punctuation.delimiter"] = {
      fg = "white",
    },
    ["@tag.delimiter"] = {
      fg = "white",
    },
    ["@variable"] = {
      fg = "red",
    },
    ["@markup.heading"] = {
      fg = "white",
    },
    ["@markup.link.label"] = {
      fg = "white",
    },
    ["@punctuation.bracket"] = {
      fg = "#E5BD7B",
    },
    ["Special"] = {
      fg = "red",
    },
    ["Type"] = {
      fg = "red",
    },
    ["@operator"] = {
      fg = "cyan",
    },
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}
-- M.colorify {
--   enabled = false,
-- }

return M
