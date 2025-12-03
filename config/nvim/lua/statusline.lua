local M = {}

local function set_statusline_color()
    local default_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
    local default_bg = default_hl.bg
    local default_fg = default_hl.fg

    local mode_color_bg = {
      n  = default_bg, -- normal
      i  = "#2a8bc1", -- insert
      v  = "#ea4727", -- visual
      V  = "#ea4727", -- visual line
      ["\22"] = "#ea4727", -- visual block (CTRL-V)
      c  = "#49e998", -- command
      R  = "#fb9435", -- replace
    }

    local mode_color_fg = {
      n  = default_fg,
      i  = default_bg,
      v  = default_bg,
      V  = default_bg,
      ["\22"] = default_bg,
      c  = default_bg,
      R  = default_bg,
    }

    local m = vim.fn.mode()
    local bg = mode_color_bg[m] or default_bg
    local fg = mode_color_fg[m] or default_fg

    vim.api.nvim_set_hl(0, "StatusLine", { bg = bg, fg = fg })
end

function M.setup()
  vim.o.statusline = "%f%=%l:%c"

  vim.api.nvim_create_autocmd("ModeChanged", {
    callback = function()
      set_statusline_color()
    end
  })

  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      set_statusline_color()
    end
  })
end

return M
