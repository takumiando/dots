local wezterm = require 'wezterm';

return {
    font = wezterm.font_with_fallback({
        "UDEV Gothic LG",
        "JetBrains Mono",
    }),
    font_size = 12.0,

    color_scheme = "Doom Peacock",
    colors = {
        selection_bg = "white",
        selection_fg = "black",
    },
    window_background_opacity = 0.8,

    use_fancy_tab_bar = false,
    enable_tab_bar = false,
    enable_scroll_bar = false,
    tab_bar_at_bottom = true,

    window_padding = {
        left = "40px",
        right = "40px",
        top = "40px",
        bottom = "40px",
    },

    enable_wayland = true,
    use_ime = true,
    exit_behavior = "Close",
}
