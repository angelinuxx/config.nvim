return {
  "3rd/image.nvim",
  build = false,
  config = function()
    require("image").setup {
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      tmux_show_only_in_active_window = true, -- auto show/hide images in the correct Tmux window (needs visual-activity off)
      processor = "magick_cli",
    }
  end,
}
