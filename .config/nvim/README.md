# NeoVim configuration

My NeoVim configuration is currently based off of [LazyVim](https://github.com/LazyVim/LazyVim) 💤

This is meant to be more of an IDE configuration, I wouldn't really call it 'lightweight'.

## Theme customization

The theme is determined at runtime by reading `active_theme.txt` , which should consist of a single line. The name of the theme and (if present) the flavor of the theme are separated by an underscore (no underscores should be present in the theme name or the flavor name).

If the file does not exist, is empty, or if you have an invalid theme name (determined by the key not existing in the `THEMES` table in `lua/plugins/theme.lua`), this defers to the default LazyVim theme (`tokyonight_moon`), but without any changes applied in the `theme.lua` file.

If you have an invalid or nil subtheme name (i.e. `tokyonight_wrong` - the `wrong` is invalid), the handling of this defers to the plugin. Usually, `nil` (no underscore but valid theme name, for example, `catppuccin`) will resort to the plugin using a default theme, and invalid strings cause LazyVim to fail to load the plugin and apply the colorscheme.

The theme gets loaded in into the global `DOTFILES_ACTIVE_THEME` prior to any LazyVim initialization.

## Install Requirements

- a [Nerd Font](https://nerdfonts.com/)
- fzf
- lazygit
- ripgrep
- fd (alternative to GNU `find`)
- LSPs usually assume that you have the language tooling installed already (i.e. for Rust, install rust-analyzer with `rustup`)
