return {
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    keys = { { "<leader>nf", "<cmd>Neogen<cr>", desc = "Neogen" } },
    config = function()
      require("neogen").setup({
        enabled = true,
        languages = {
          python = {
            template = {
              annotation_convention = "reST", -- for a full list of annotation_conventions, see supported-languages below,
            },
          },
        },
      })
    end,
  },
}
