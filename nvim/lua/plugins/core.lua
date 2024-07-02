return {

  { "rcarriga/nvim-notify", enabled = false },

  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_disable_terminal_colors = 1
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_colors_override = {
        bg0 = { "#09090F", "16" },
        bg_dim = { "#09090F", "16" },
        bg1 = { "#09090F", "16" },
        bg_statusline1 = { "#09090F", "16" },
        bg_statusline3 = { "#32302F", "16" },
      }
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
