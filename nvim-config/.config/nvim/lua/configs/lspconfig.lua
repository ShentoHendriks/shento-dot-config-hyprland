require("nvchad.configs.lspconfig").defaults()

-- lsp visit lspconfig github for avaiable server names
-- must install with :MasonInstallAll
local servers = {
  html = {},
  lua_ls = {},
  cssls = {},
  ts_ls = {},
  svelte = {},
  emmet_ls = {
    filetypes = {
      "html",
      "css",
      "scss",
      "javascript",
      "typescript",
      "typescriptreact",
      "javascriptreact",
      "svelte",
      "vue",
      "astro",
    },
  },
  somesass_ls = {},
  volar = {},
  astro = {},
  tailwindcss = {},
  texlab = {},
}

for name, opts in pairs(servers) do
  vim.lsp.enable(name) -- nvim v0.11.0 or above required
  vim.lsp.config(name, opts) -- nvim v0.11.0 or above required
end
