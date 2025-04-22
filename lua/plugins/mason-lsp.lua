return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "gopls",
          "rust_analyzer",
          "codelldb",
          "typescipt-language-server",
          "denols",
          "pyright",
          "ruff",
          "black",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      --local on_attach = lspconfig.on_attach
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.denols.setup({
        --on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
      })
      lspconfig.rust_analyzer.setup({
        settings = {
          ["rust-analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            },
            cargo = {
              buildScripts = {
                enable = true,
              },
            },
            procMacro = {
              enable = true,
            },
          },
        },
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
        --on_attach = on_attach,
        root_dir = lspconfig.util.root_pattern("package.json", "index.js"),
        single_file_support = false,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
        filetypes = { "python" },
        settings = {
          pyright = {
            -- Using Ruff's import organizer
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              -- Ignore all files for analysis to exclusively use Ruff for linting
              ignore = { "*" },
            },
          },
        },
      })
      lspconfig.ruff.setup({})
      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        settings = {
          gopls = {
            staticcheck = true,
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedparams = true,
            },
          },
        },
      })
      vim.keymap.set("n", "<leader>H", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
