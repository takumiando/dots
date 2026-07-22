local M = {}

local function set_statusline_color()
  local default_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
  local default_bg = default_hl.bg
  local default_fg = default_hl.fg

  local mode_color_bg = {
    n = default_bg, -- Normal
    i = "#2a8bc1", -- Insert
    v = "#ea4727", -- Visual
    V = "#ea4727", -- Visual Line
    ["\22"] = "#ea4727", -- Visual Block (CTRL-V)
    c = "#49e998", -- Command
    R = "#fb9435", -- Replace
  }

  local mode_color_fg = {
    n = default_fg,
    i = default_bg,
    v = default_bg,
    V = default_bg,
    ["\22"] = default_bg,
    c = default_bg,
    R = default_bg,
  }

  local mode = vim.fn.mode()
  local bg = mode_color_bg[mode] or default_bg
  local fg = mode_color_fg[mode] or default_fg

  vim.api.nvim_set_hl(0, "StatusLine", { bg = bg, fg = fg })
end

function M.setup()
  vim.o.statusline = "%f%=%l:%c"

  vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
      set_statusline_color()
    end,
  })

  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      set_statusline_color()
    end,
  })
end

return M
