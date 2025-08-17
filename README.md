# VSCodeDark.nvim

A thoughtfully crafted Neovim colorscheme that brings the clean, modern aesthetic of VSCode’s **Dark Modern** theme to neovim. Zero distractions, Just code.

## Installation

### Requirements

- Neovim 0.7+
- [lush.nvim](https://github.com/rktjmp/lush.nvim) (used for theme building)

### With [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "SharanPadmanabhan/vscodedark.nvim",
  name = "vscodedark",
  lazy = false,
  priority = 1000,
  dependencies = { "rktjmp/lush.nvim" },
}
```

### With [vim-plug](https://github.com/junegunn/vim-plug)

```vim
Plug 'rktjmp/lush.nvim'
Plug 'SharanPadmanabhan/vscodedark.nvim'
```

## Usage

Once installed, set the colorscheme:

```vim
" Vimscript
colorscheme vscodedark
```

```lua
-- Lua
vim.cmd("colorscheme vscodedark")
```

## Customization

Want to tweak it?

Because this theme is built with `lush.nvim`, customization is straightforward:

1. Open `lua/lush_theme/vscodedark.lua`
2. Run `:Lushify` inside Neovim.
3. Edit highlight groups or hex codes with live preview.

You can relink groups, adjust contrast, or build a variant theme with ease.

## Screenshots

> This is a WIP repo. Screenshots will be updated after final tweaks — stay tuned!

## Contributing

PRs and issues welcome — especially for plugin support, bug fixes, or theme variants (e.g. high contrast, warmer tone, etc).

## License

[MIT](./LICENSE)
