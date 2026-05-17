return {
   "sainnhe/everforest",
   priority = 1000,
  lazy = false, -- load early to avoid visual glitches
  config = function()
    vim.g.everforest_background = 'hard'          -- 'soft', 'medium' (default), 'hard'
    vim.g.everforest_enable_italic = 1
    vim.g.everforest_disable_italic_comment = 1   -- italics for keywords/functions only
    vim.g.everforest_better_performance = 1       -- disables unused UI features
  end,
}
