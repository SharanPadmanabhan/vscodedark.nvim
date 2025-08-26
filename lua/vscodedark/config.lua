local M = {}

--- @class vscodedark.Colors
--- Represents the color palette used by the colorscheme.
--- Typically a table of color name keys to hex strings or color definitions.

--- @class vscodedark.Highlight
--- @field style? vscodedark.StyleEntry
--- Represents a highlight group configuration, which can be a simple color or a table with style fields.

--- @alias vscodedark.Highlights table<string, vscodedark.Highlight|string>
--- A map from highlight group names to their configurations.

--- @class vscodedark.StyleEntry
--- Describes style options for a syntax group or highlight.
--- @field bold? boolean            Enable bold text
--- @field italic? boolean          Enable italic text
--- @field underline? boolean       Enable underline text
--- @field undercurl? boolean       Enable wavy underline
--- @field underdouble? boolean     Enable double underline
--- @field strikethrough? boolean   Enable strikethrough text
--- @field reverse? boolean         Swap foreground and background colors
--- @field nocombine? boolean       Prevent combining this style with others

--- @class vscodedark.Styles
--- Defines styling for various syntax groups and UI elements.
--- @field comments? vscodedark.StyleEntry Style applied to comments
--- @field keywords? vscodedark.StyleEntry Style applied to keywords
--- @field functions? vscodedark.StyleEntry Style applied to function names
--- @field variables? vscodedark.StyleEntry Style applied to variables
--- @field sidebars? "dark" | "transparent" | "normal" Background style for sidebar windows
--- @field floats? "dark" | "transparent" | "normal" Background style for floating windows

--- @class vscodedark.Config
--- Configuration options for the colorscheme.
--- @field transparent? boolean           Disable background color when true
--- @field terminal_colors? boolean       Enable terminal colors in Neovim terminal buffers
--- @field styles? vscodedark.Styles      Syntax and UI styles
--- @field on_colors? fun(colors: vscodedark.Colors) Callback for customizing color palette
--- @field on_highlights? fun(highlights: vscodedark.Highlights, colors: vscodedark.Colors) Callback for customizing highlights

-- Default configuration values
M.defaults = {
  transparent = false,
  terminal_colors = true,
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    sidebars = "dark",
    floats = "dark",
  },
  on_colors = function(colors) end,
  on_highlights = function(highlights, colors) end,
}

--- Holds the current active configuration options.
--- @type vscodedark.Config|nil
M.options = nil

--- Set up the colorscheme configuration by merging user options with defaults.
--- @param options? vscodedark.Config User-provided configuration options
function M.setup(options)
  M.options = vim.tbl_deep_extend("force", {}, M.defaults, options or {})
end

--- Extend the current configuration by merging additional options.
--- Returns the merged configuration or current config if no options provided.
--- @param opts? vscodedark.Config Additional options to merge
--- @return vscodedark.Config Merged configuration table
function M.extend(opts)
  if opts then
    return vim.tbl_deep_extend("force", {}, M.options or M.defaults, opts)
  else
    return M.options or M.defaults
  end
end

--- Metatable to provide fallback to defaults when `M.options` is nil
setmetatable(M, {
  __index = function(_, key)
    if key == "options" then
      return M.defaults
    end
  end,
})

return M
