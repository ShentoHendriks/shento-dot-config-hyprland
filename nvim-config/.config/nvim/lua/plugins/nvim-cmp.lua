return {
  "hrsh7th/nvim-cmp",
  opts = function()
    local cmp = require "cmp"
    local conf = require "nvchad.configs.cmp"

    local mymappings = {
      ["<C-K>"] = cmp.mapping.select_prev_item(),
      ["<C-J>"] = cmp.mapping.select_next_item(),
      ["<Enter>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
    }
    conf.mapping = vim.tbl_deep_extend("force", conf.mapping, mymappings)
    return conf
  end,
}
