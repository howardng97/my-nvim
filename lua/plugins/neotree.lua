return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = true, -- Theo dõi file đang mở
        hijack_netrw = true,    -- Thay thế netrw
      },
      window = {
        width = 30,           -- Giá trị ban đầu
        auto_expand_width = true, -- Tự động mở rộng chiều rộng
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree toggle filesystem reveal right<CR>", { noremap = true, silent = true })
  end,
}
