return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/nvim-lsp-installer", -- Optional, for easier LSP server installation
  },
  opts = {
    servers = {
      tailwindcss = {
        -- Optional: Customize the root directory detection
        root_dir = function(fname)
          return require("lspconfig.util").root_pattern("tailwind.config.js", "package.json")(fname) or vim.fn.getcwd()
        end,
        -- Optional: Customize the settings for the Tailwind CSS LSP server
        settings = {
          tailwindcss = {
            experimental = {
              classRegex = {
                { "cva\\(([^)]*)\\)", "[\\\"'`]([^\\\"'`]*).*?[\\\"'`]" },
                { "cx\\(([^)]*)\\)", "(?:' |\\\"|`)([^']*)(?:' |\\\"|`)" },
                { "cn\\(([^)]*)\\)", "[\\\"'`]([^\\\"'`]*).*?[\\\"'`]" },
                { "([a-zA-Z0-9\\-:]+)" },
              },
            },
            includeLanguages = {
              elixir = "html-eex",
              eelixir = "html-eex",
              heex = "html-eex",
            },
          },
        },
      },
    },
  },
}
