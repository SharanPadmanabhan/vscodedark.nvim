-- Template: https://github.com/rktjmp/lush-template/blob/main/lua/lush_theme/lush_template.lua
-- VSCode Theme Color Reference: https://code.visualstudio.com/api/references/theme-color#command-center-colors

local lush = require("lush")

local colors = require("vscodedark.colors")
local opts = require("vscodedark.config").extend({})

---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  return {
    -- UI: Cursor & Editor Columns
    ColorColumn { bg = colors.indent_guide },  -- Columns set with 'colorcolumn'
    Cursor { fg = colors.bg, bg = colors.fg }, -- Character under the cursor
    lCursor { Cursor },                        -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM { Cursor },                       -- Like Cursor, but used when in IME mode |CursorIM|
    CursorLine { bg = colors.black2 },         -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine },               -- Screen-column at the cursor, when 'cursorcolumn' is set.
    Conceal { fg = colors.gray2 },             -- Placeholder characters substituted for concealed text (see 'conceallevel')

    -- UI: Window Elements
    Directory { fg = colors.dark_blue }, -- Directory na:mes (and other special names in listings)
    EndOfBuffer { fg = Normal.bg },      -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    NonText { fg = "#515861" },          -- '@' at the end of the window... See also |hl-EndOfBuffer|.
    Normal {
      fg = colors.fg,
      bg = opts.transparent and colors.none or colors.bg,
    }, -- Normal text
    NormalNC {
      fg = colors.fg,
      bg = opts.transparent and colors.none or colors.bg,
    },                                           -- normal text in non-current windows
    WinBar { fg = "#a8a8a8", bg = Normal.bg },   -- Window bar of current window
    WinBarNC { fg = "#a8a8a8", bg = Normal.bg }, -- Window bar of not-current windows
    WinSeparator { fg = "#2d2d2d" },             -- Separator between window splits
    VertSplit { WinSeparator },                  -- Column separating vertically split windows
    Whitespace { fg = colors.whitespace },       -- "nbsp", "space", "tab" and "trail" in 'listchars'

    -- UI: Editor Gutter (line numbers, folds, signs)
    LineNr { fg = "#515861", bg = colors.none },       -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    LineNrAbove { LineNr },                            -- Line number for when the 'relativenumber' option is set, above the cursor line
    LineNrBelow { LineNr },                            -- Line number for when the 'relativenumber' option is set, below the cursor line
    CursorLineNr { fg = "#dfdfdf", bg = colors.none }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    SignColumn { bg = Normal.bg },                     -- Column where |signs| are displayed
    Folded { bg = colors.bg_folded },                  -- Line used for closed folds
    FoldColumn { SignColumn },                         -- 'foldcolumn'
    CursorLineFold { CursorLineNr },                   -- Like FoldColumn when 'cursorline' is set for the cursor line
    CursorLineSign { SignColumn },                     -- Like SignColumn when 'cursorline' is set for the cursor line

    -- Diff Mode
    DiffTextAdded { bg = "#214d29" },   -- Added text within changed lines
    DiffTextDeleted { bg = "#712928" }, -- Deleted text within changed lines
    DiffTextChanged { bg = "#283871" }, -- Changed text within changed lines

    DiffLineAdded { bg = "#203424" },   -- Entire added lines
    DiffLineDeleted { bg = "#442423" }, -- Entire deleted lines
    DiffLineChanged { bg = "#0e2f44" }, -- Entire changed lines

    DiffAdd { DiffLineAdded },          -- Diff mode: Added line |diff.txt|
    DiffChange { DiffLineChanged },     -- Diff mode: Changed line |diff.txt|
    DiffDelete { DiffLineDeleted },     -- Diff mode: Deleted line |diff.txt|
    DiffText { DiffTextChanged },       -- Diff mode: Changed text within a changed line |diff.txt|

    -- Terminal UI
    TermCursor { Cursor }, -- Cursor in a focused terminal

    -- Search & Matching
    Search { bg = "#462819" },                                    -- Last search pattern highlighting (see 'hlsearch')
    CurSearch { bg = "#5e3019" },                                 -- Highlighting a search pattern under the cursor (see 'hlsearch')
    IncSearch { CurSearch },                                      -- 'incsearch' highlighting
    Substitute { Search },                                        -- |:substitute| replacement text highlighting
    MatchParen { bg = "#3e3d3d", bold = true, underline = true }, -- Character under the cursor or just before it, if it is a paired bracket

    -- Messages & Prompts
    ErrorMsg { fg = colors.error },      -- Error messages on the command line
    WarningMsg { fg = colors.warn },     -- Warning messages
    MoreMsg { fg = colors.fg },          -- |more-prompt|
    ModeMsg { fg = colors.fg },          -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea { fg = colors.fg },          -- Area for messages and cmdline
    MsgSeparator { bg = colors.black4 }, -- Separator for scrolled messages
    Question { fg = colors.dark_blue },  -- |hit-enter| prompt and yes/no questions

    -- Scrollbar
    Scrollbar { bg = Normal.bg },      -- Scrollbar background
    ScrollbarThumb { bg = "#5b5b5b" }, -- Scrollbar Thumb

    -- Popup Menu
    Pmenu { fg = colors.fg, bg = Normal.bg },                             -- Popup menu: Normal item.
    PmenuSel { fg = colors.white, bg = colors.bg_selected, bold = true }, -- Popup menu: Selected item.
    PmenuKind { Pmenu },                                                  -- Popup menu: Normal item "kind"
    PmenuKindSel { PmenuSel },                                            -- Popup menu: Selected item "kind"
    PmenuExtra { Pmenu },                                                 -- Popup menu: Normal item "extra text"
    PmenuExtraSel { PmenuSel },                                           -- Popup menu: Selected item "extra text"
    PmenuSbar { Scrollbar },                                              -- Popup menu: Scrollbar.
    PmenuThumb { ScrollbarThumb },                                        -- Popup menu: Thumb of the scrollbar.

    -- Quickfix, Wildmenu, Tabline, Statusline
    QuickFixLine { bg = "#3a3d41" },                         -- Current |quickfix| item
    WildMenu { PmenuSel },                                   -- Current match in 'wildmenu' completion
    TabLine { fg = colors.gray4, bg = colors.bg_dark },      -- Tab pages line, not active tab page label
    TabLineFill { fg = colors.none, bg = colors.bg_dark },   -- Tab pages line, where there are no labels
    TabLineSel { fg = colors.white, bg = Normal.bg },        -- Tab pages line, active tab page label
    StatusLine { bg = colors.bg_dark },                      -- Status line of current window
    StatusLineNC { fg = colors.gray1, bg = colors.bg_dark }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.

    -- Visual Modes
    Visual { bg = colors.selection }, -- Visual mode selection
    VisualNOS { Visual },             -- Visual mode selection when vim is "Not Owning the Selection".

    -- Titles & Links
    Title { fg = colors.dark_blue, bold = true }, -- Titles for output from ":set all", ":autocmd" etc.
    Underlined { underline = true },              -- Text that stands out, HTML links

    -- Floating Windows
    NormalFloat { Pmenu },                    -- Normal text in floating windows.
    FloatBorder { fg = colors.float_border }, -- Border of floating windows.
    FloatTitle { Title },                     -- Title of floating windows.

    -- Spellchecking
    SpellBad { sp = colors.error, undercurl = true },  -- Word that is not recognized by the spellchecker
    SpellCap { sp = colors.warn, undercurl = true },   -- Word that should start with a capital
    SpellLocal { sp = colors.info, undercurl = true }, -- Word used in another region
    SpellRare { sp = colors.info, undercurl = true },  -- Rarely used word

    -- Syntax: Comments
    Comment {
      fg = colors.green,
      bold = opts.styles.comments.bold,
      italic = opts.styles.comments.italic,
      underline = opts.styles.comments.underline,
      undercurl = opts.styles.comments.undercurl,
      underdouble = opts.styles.comments.underdouble,
      strikethrough = opts.styles.comments.strikethrough,
      reverse = opts.styles.comments.reverse,
      nocombine = opts.styles.comments.nocombine,
    }, -- Any comment

    -- Syntax: Constants
    Constant { fg = colors.dark_blue }, -- (*) Any constant
    String { fg = colors.brown },       -- A string constant
    Character { Constant },             -- A character constant
    Number { fg = colors.light_green }, -- A number constant
    Boolean { Constant },               -- A boolean constant
    Float { Number },                   -- A floating point constant

    -- Syntax: Identifiers
    Identifier {
      fg = colors.light_blue,
      bold = opts.styles.variables.bold,
      italic = opts.styles.variables.italic,
      underline = opts.styles.variables.underline,
      undercurl = opts.styles.variables.undercurl,
      underdouble = opts.styles.variables.underdouble,
      strikethrough = opts.styles.variables.strikethrough,
      reverse = opts.styles.variables.reverse,
      nocombine = opts.styles.variables.nocombine,
    }, -- Any variable name

    Function {
      fg = colors.yellow,
      bold = opts.styles.functions.bold,
      italic = opts.styles.functions.italic,
      underline = opts.styles.functions.underline,
      undercurl = opts.styles.functions.undercurl,
      underdouble = opts.styles.functions.underdouble,
      strikethrough = opts.styles.functions.strikethrough,
      reverse = opts.styles.functions.reverse,
      nocombine = opts.styles.functions.nocombine,
    }, -- Function name

    -- Syntax: Statements
    Statement { fg = colors.pink }, -- Any statement
    Conditional { Statement },      -- if, then, else, etc.
    Repeat { Statement },           -- for, do, while, etc.
    Label { Statement },            -- case, default, etc.
    Operator { fg = colors.fg },    -- "+", "*", etc.
    Keyword {
      fg = colors.dark_blue,
      bold = opts.styles.keywords.bold,
      italic = opts.styles.keywords.italic,
      underline = opts.styles.keywords.underline,
      undercurl = opts.styles.keywords.undercurl,
      underdouble = opts.styles.keywords.underdouble,
      strikethrough = opts.styles.keywords.strikethrough,
      reverse = opts.styles.keywords.reverse,
      nocombine = opts.styles.keywords.nocombine,
    },                       -- any other keyword
    Exception { Statement }, -- try, catch, throw

    -- Syntax: Preprocessor
    PreProc { fg = colors.pink }, -- Generic Preprocessor
    Include { PreProc },          -- Preprocessor #include
    Define { PreProc },           -- Preprocessor #define
    Macro { PreProc },            -- Same as Define
    PreCondit { PreProc },        -- #if, #else, etc.

    -- Syntax: Types
    Type { fg = colors.dark_blue }, -- int, long, char, etc.
    StorageClass { Type },          -- static, register, etc.
    Structure { Type },             -- struct, union, enum, etc.
    Typedef { Type },               -- A typedef

    -- Syntax: Specials
    Special { fg = colors.yellow_orange }, -- Any special symbol
    SpecialChar { Special },               -- Special character in a constant
    SpecialKey { Special },                -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    Tag { Special },                       -- Tag reference
    Delimiter { Special },                 -- Character that needs attention
    SpecialComment { Special },            -- Special things inside a comment
    Debug { Special },                     -- Debugging statements

    -- Misc
    Ignore { Normal },                                        -- Hidden
    Error { fg = colors.error },                              -- Any erroneous construct
    Todo { fg = colors.bg, bg = colors.orange, bold = true }, -- TODO / FIXME / XXX

    -- LSP: References and CodeLens
    LspReferenceText { bg = "#343a41" },                            -- Highlighting "text" references
    LspReferenceRead { bg = "#343a41" },                            -- Highlighting "read" references
    LspReferenceWrite { bg = "#343a41" },                           -- Highlighting "write" references
    LspCodeLens { fg = "#999999" },                                 -- Virtual text of the codelens
    LspCodeLensSeparator { fg = colors.matched },                   -- Separator between multiple code lenses
    LspSignatureActiveParameter { fg = "#969696", bg = "#292929" }, -- Highlight the active parameter in signature help

    -- Diagnostics: Base Highlights
    DiagnosticError { fg = colors.error }, -- Base: Error
    DiagnosticWarn { fg = colors.warn },   -- Base: Warning
    DiagnosticInfo { fg = colors.info },   -- Base: Info
    DiagnosticHint { fg = colors.hint },   -- Base: Hint
    DiagnosticOk { fg = colors.ok },       -- Base: Ok

    -- Diagnostics: Virtual Text
    DiagnosticVirtualTextError { DiagnosticError, bg = colors.none }, -- Virtual text: Error
    DiagnosticVirtualTextWarn { DiagnosticWarn, bg = colors.none },   -- Virtual text: Warning
    DiagnosticVirtualTextInfo { DiagnosticInfo, bg = colors.none },   -- Virtual text: Info
    DiagnosticVirtualTextHint { DiagnosticHint, bg = colors.none },   -- Virtual text: Hint
    DiagnosticVirtualTextOk { DiagnosticOk, bg = colors.none },       -- Virtual text: Ok

    -- Diagnostics: Underlines
    DiagnosticUnderlineError { sp = colors.error, undercurl = true }, -- Underline: Error
    DiagnosticUnderlineWarn { sp = colors.warn, undercurl = true },   -- Underline: Warning
    DiagnosticUnderlineInfo { sp = colors.info, undercurl = true },   -- Underline: Info
    DiagnosticUnderlineHint { sp = colors.hint, undercurl = true },   -- Underline: Hint
    DiagnosticUnderlineOk { sp = colors.ok, undercurl = true },       -- Underline: Ok

    -- Diagnostics: Floating Windows
    DiagnosticFloatingError { DiagnosticError }, -- Floating: Error
    DiagnosticFloatingWarn { DiagnosticWarn },   -- Floating: Warning
    DiagnosticFloatingInfo { DiagnosticInfo },   -- Floating: Info
    DiagnosticFloatingHint { DiagnosticHint },   -- Floating: Hint
    DiagnosticFloatingOk { DiagnosticOk },       -- Floating: Ok

    -- Diagnostics: Signs
    DiagnosticSignError { DiagnosticError }, -- Sign: Error
    DiagnosticSignWarn { DiagnosticWarn },   -- Sign: Warning
    DiagnosticSignInfo { DiagnosticInfo },   -- Sign: Info
    DiagnosticSignHint { DiagnosticHint },   -- Sign: Hint
    DiagnosticSignOk { DiagnosticOk },       -- Sign: Ok

    -- Diagnostics: Special
    DiagnosticUnnecessary { fg = colors.gray2 },
    DiagnosticDeprecated { fg = colors.gray3, strikethrough = true },

    -- Variables
    sym("@variable") { fg = colors.light_blue },                       -- various variable names
    sym("@variable.builtin") { fg = colors.dark_blue },                -- built-in variable names (e.g. `this`)
    sym("@variable.parameter") { fg = colors.light_blue },             -- parameters of a function
    sym("@variable.parameter.builtin") { sym("@variable.parameter") }, -- special parameters (e.g. `_`, `it`)
    sym("@variable.member") { fg = colors.light_blue },                -- object and struct fields

    -- Constants
    sym("@constant") { Constant },         -- constant identifiers
    sym("@constant.builtin") { Constant }, -- built-in constant values
    sym("@constant.macro") { Constant },   -- constants defined by the preprocessor

    -- Modules & Labels
    sym("@module") { fg = colors.teal },       -- modules or namespaces
    sym("@module.builtin") { sym("@module") }, -- built-in modules or namespaces
    sym("@label") { fg = colors.fg_label },    -- GOTO and other labels (e.g. `label:` in C), including heredoc labels

    -- Strings
    sym("@string") { String },                                -- string literals
    sym("@string.documentation") { String },                  -- string documenting code (e.g. Python docstrings)
    sym("@string.regexp") { fg = colors.red },                -- regular expressions
    sym("@string.escape") { fg = colors.yellow_orange },      -- escape sequences
    sym("@string.special") { SpecialChar },                   -- other special strings (e.g. dates)
    sym("@string.special.symbol") { sym("@string.special") }, -- symbols or atoms
    sym("@string.special.url") { sym("@string.special") },    -- URIs (e.g. hyperlinks)
    sym("@string.special.path") { sym("@string.special") },   -- filenames

    -- Characters
    sym("@character") { Character },           -- character literals
    sym("@character.special") { SpecialChar }, -- special characters (e.g. wildcards)

    -- Booleans and Numbers
    sym("@boolean") { Boolean },    -- boolean literals
    sym("@number") { Number },      -- numeric literals
    sym("@number.float") { Float }, -- floating-point number literals

    -- Types
    sym("@type") { fg = colors.teal },              -- type or class definitions and annotations
    sym("@type.builtin") { fg = colors.dark_blue }, -- built-in types
    sym("@type.definition") { fg = colors.teal },   -- identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)

    -- Attributes & Property
    sym("@attribute") { fg = colors.teal },          -- attribute annotations (e.g. Python decorators, Rust lifetimes)
    sym("@attribute.builtin") { sym("@attribute") }, -- builtin annotations (e.g. `@property` in Python)
    sym("@property") { sym("@variable.member") },    -- the key in key/value pairs

    -- Functions & Methods
    sym("@function") { Function },                          -- function definitions
    sym("@function.builtin") { Function },                  -- built-in functions
    sym("@function.call") { Function },                     -- function calls
    sym("@function.macro") { Function },                    -- preprocessor macros
    sym("@function.method") { sym("@function") },           -- method definitions
    sym("@function.method.call") { sym("@function.call") }, -- method calls
    sym("@constructor") { sym("@function") },               -- constructor calls and definitions

    -- Operators & Keywords
    sym("@operator") { Operator },                                  -- symbolic operators (e.g. `+` / `*`)
    sym("@keyword") { Keyword },                                    -- keywords not fitting into specific categories
    sym("@keyword.coroutine") { fg = colors.pink },                 -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    sym("@keyword.function") { fg = colors.dark_blue },             -- keywords that define a function (e.g. `func` in Go, `def` in Python)
    sym("@keyword.operator") { fg = colors.pink },                  -- operators that are English words (e.g. `and` / `or`)
    sym("@keyword.import") { Include },                             -- keywords for including or exporting modules (e.g. `import` / `from` in Python)
    sym("@keyword.type") { fg = colors.dark_blue },                 -- keywords describing namespaces and composite types (e.g. `struct`, `enum`)
    sym("@keyword.modifier") { fg = colors.dark_blue },             -- keywords modifying other constructs (e.g. `const`, `static`, `public`)
    sym("@keyword.repeat") { Repeat },                              -- keywords related to loops (e.g. `for` / `while`)
    sym("@keyword.return") { fg = colors.pink },                    -- keywords like `return` and `yield`
    sym("@keyword.debug") { Debug },                                -- keywords related to debugging
    sym("@keyword.exception") { Exception },                        -- keywords related to exceptions (e.g. `throw` / `catch`)
    sym("@keyword.conditional") { Conditional },                    -- keywords related to conditionals (e.g. `if` / `else`)
    sym("@keyword.conditional.ternary") { sym("@operator") },       -- ternary operator (e.g. `?` / `:`)
    sym("@keyword.directive") { PreProc },                          -- various preprocessor directives & shebangs
    sym("@keyword.directive.define") { sym("@keyword.directive") }, -- preprocessor definition directives

    -- Punctuation
    sym("@punctuation.delimiter") { fg = colors.fg },      -- delimiters (e.g. `;` / `.` / `,`)
    sym("@punctuation.bracket") { fg = colors.fg },        -- brackets (e.g. `()` / `{}` / `[]`)
    sym("@punctuation.special") { fg = colors.dark_blue }, -- special symbols (e.g. `{}` in string interpolation)

    -- Comments
    sym("@comment") { Comment },                       -- line and block comments
    sym("@comment.documentation") { sym("@comment") }, -- comments documenting code
    sym("@comment.error") { fg = colors.error, },      -- error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
    sym("@comment.warning") { fg = colors.warn },      -- warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
    sym("@comment.todo") { Todo },                     -- todo-type comments (e.g. `TODO`, `WIP`)
    sym("@comment.note") { fg = colors.info },         -- note-type comments (e.g. `NOTE`, `INFO`, `XXX`)

    -- Markup & TextFormatting
    sym("@markup.strong") { fg = colors.fg, bold = true },                 -- bold text
    sym("@markup.italic") { fg = colors.fg, italic = true },               -- italic text
    sym("@markup.strikethrough") { fg = colors.fg, strikethrough = true }, -- struck-through text
    sym("@markup.underline") { fg = colors.fg, underline = true },         -- underlined text (only for literal underline markup!)

    sym("@markup.heading") { Title },                                      -- headings, titles (including markers)
    sym("@markup.heading.1") { fg = colors.cornflower, bold = true },      -- top-level heading
    sym("@markup.heading.2") { fg = colors.green, bold = true },           -- section heading
    sym("@markup.heading.3") { fg = colors.dark_blue, bold = true },       -- subsection heading
    sym("@markup.heading.4") { fg = colors.red, bold = true },             -- and so on
    sym("@markup.heading.5") { fg = colors.yellow, bold = true },          -- and so forth
    sym("@markup.heading.6") { fg = colors.pink, bold = true },            -- six levels ought to be enough for anybody

    sym("@markup.quote") { fg = colors.violet },                           -- block quotes
    sym("@markup.math") { fg = colors.teal },                              -- math environments (e.g. `$ ... $` in LaTeX)

    sym("@markup.link") { fg = colors.fg },                                -- text references, footnotes, citations, etc.
    sym("@markup.link.label") { fg = colors.brown },                       -- link, reference descriptions
    sym("@markup.link.url") { fg = colors.dark_blue, underline = true },   -- URL-style links

    sym("@markup.raw") { fg = colors.brown },                              -- literal or verbatim text (e.g. inline code)
    sym("@markup.raw.block") { fg = colors.fg },                           -- literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)

    sym("@markup.list") { fg = colors.cornflower },                        -- list markers
    sym("@markup.list.checked") { sym("@markup.list") },                   -- checked todo-style list markers
    sym("@markup.list.unchecked") { sym("@markup.list") },                 -- unchecked todo-style list markers

    -- Diff Markup (for version control)
    sym("@diff.plus") { DiffTextAdded },    -- added text (for diff files)
    sym("@diff.minus") { DiffTextDeleted }, -- deleted text (for diff files)
    sym("@diff.delta") { DiffTextChanged }, -- changed text (for diff files)

    -- Tags (e.g. HTML, XML)
    sym("@tag") { fg = colors.dark_blue },            -- XML-style tag names (and similar)
    sym("@tag.builtin") { sym("@tag") },              -- builtin tag names (e.g. HTML5 tags)
    sym("@tag.attribute") { fg = colors.light_blue }, -- XML-style tag attributes
    sym("@tag.delimiter") { fg = colors.gray3 },      -- XML-style tag delimiters

    sym("@conceal") { fg = colors.gray1 },            -- captures that are only meant to be concealed

    -- sym("(function_definition) @fold"){}, -- fold this node

    -- sym("@local.definition"){}, -- various definitions
    -- sym("@local.definition.constant"){}, -- constants
    -- sym("@local.definition.function"){}, -- functions
    -- sym("@local.definition.method"){}, -- methods
    -- sym("@local.definition.var"){}, -- variables
    -- sym("@local.definition.parameter"){}, -- parameters
    -- sym("@local.definition.macro"){}, -- preprocessor macros
    -- sym("@local.definition.type"){}, -- types or classes
    -- sym("@local.definition.field"){}, -- fields or properties
    -- sym("@local.definition.enum"){}, -- enumerations
    -- sym("@local.definition.namespace"){}, -- modules or namespaces
    -- sym("@local.definition.import"){}, -- imported names
    -- sym("@local.definition.associated"){}, -- the associated type of a variable

    -- sym("@local.scope"){}, -- scope block
    -- sym("@local.reference"){}, -- identifier reference

    -- LSP Semantic Tokens
    sym("@lsp.type.namespace") { sym("@module") },               -- Namespace, module, or package grouping
    sym("@lsp.type.type") { sym("@type") },                      -- Type entity (class, struct, interface)
    sym("@lsp.type.class") { sym("@type") },                     -- Class type
    sym("@lsp.type.enum") { sym("@type") },                      -- Enumeration type
    sym("@lsp.type.interface") { sym("@type") },                 -- Interface type
    sym("@lsp.type.struct") { sym("@type") },                    -- Struct type
    sym("@lsp.type.typeParameter") { sym("@type.definition") },  -- Generic type parameter
    sym("@lsp.type.parameter") { sym("@variable.parameter") },   -- Function or method parameter
    sym("@lsp.type.variable") { sym("@variable") },              -- Variable
    sym("@lsp.type.property") { sym("@property") },              -- Object or class property
    sym("@lsp.type.enumMember") { fg = colors.blue },            -- Enumeration member
    sym("@lsp.type.event") { sym("@type") },                     -- Event type
    sym("@lsp.type.function") { sym("@function") },              -- Function
    sym("@lsp.type.method") { sym("@function") },                -- Method of a class or object
    sym("@lsp.type.macro") { sym("@constant.macro") },           -- Macro
    sym("@lsp.type.keyword") { sym("@keyword") },                -- Language keyword
    sym("@lsp.type.comment") { sym("@comment") },                -- Comment text
    sym("@lsp.type.string") { sym("@string") },                  -- String literal
    sym("@lsp.type.number") { sym("@number") },                  -- Number literal
    sym("@lsp.type.regexp") { sym("@string.regexp") },           -- Regular expression literal
    sym("@lsp.type.operator") { sym("@operator") },              -- Operator symbol
    sym("@lsp.type.decorator") { sym("@attribute") },            -- Decorator or annotation
    sym("@lsp.type.escapeSequence") { sym("@string.escape") },   -- Escape sequence inside strings
    sym("@lsp.type.formatSpecifier") { fg = colors.light_blue }, -- Format specifier (e.g., printf style)

    -- Built-in specific LSP types
    sym("@lsp.type.builtinType") { sym("@type.builtin") },                        -- Built-in type (e.g., int, float)
    sym("@lsp.type.typeAlias") { sym("@type.definition") },                       -- Type alias
    sym("@lsp.type.unresolvedReference") { sp = colors.error, undercurl = true }, -- Unresolved reference or symbol
    sym("@lsp.type.lifetime") { sym("@keyword.modifier") },                       -- Lifetime specifier (e.g., Rust)
    sym("@lsp.type.generic") { sym("@variable") },                                -- Generic type or template
    sym("@lsp.type.selfKeyword") { sym("@variable.builtin") },                    -- Self keyword (e.g., this/self)
    sym("@lsp.type.selfTypeKeyword") { sym("@variable.builtin") },                -- Self type keyword
    sym("@lsp.type.deriveHelper") { sym("@attribute") },                          -- Derive helper (e.g., Rust derive macros)
    sym("@lsp.type.modifier") { sym("@keyword.modifier") },                       -- Modifier keyword (e.g., public, static)

    -- LSP Modifiers
    sym("@lsp.mod.abstract") { fg = colors.pink, italic = true },           -- Abstract members (soft purple)
    sym("@lsp.mod.async") { fg = colors.dark_blue, italic = true },         -- Async functions (blue)
    sym("@lsp.mod.declaration") { fg = colors.yellow },                     -- Declarations (light yellow)
    sym("@lsp.mod.defaultLibrary") { fg = colors.teal, italic = true },     -- From standard library (aqua)
    sym("@lsp.mod.definition") { fg = colors.light_blue },                  -- Definitions (bright blue)
    sym("@lsp.mod.deprecated") { fg = colors.gray3, strikethrough = true }, -- Deprecated (gray & strikethrough)
    sym("@lsp.mod.documentation") { fg = colors.green, italic = true },     -- Documentation (green, italic)
    sym("@lsp.mod.modification") { fg = colors.brown },                     -- Modifying variable (orange)
    sym("@lsp.mod.readonly") { fg = colors.blue },                          -- Readonly variable (bright blue, bold)
    sym("@lsp.mod.static") { fg = colors.dark_blue, italic = true },        -- Static members (red)

    -- LSP Type Modifiers, metadata about the types for semantic tooling
    sym("@lsp.typemod.type.defaultLibrary") { sym("@type.builtin") },           -- Type from default library
    sym("@lsp.typemod.typeAlias.defaultLibrary") { sym("@type.builtin") },      -- Type alias from default library
    sym("@lsp.typemod.class.defaultLibrary") { sym("@type") },                  -- Class from default library
    sym("@lsp.typemod.variable.defaultLibrary") { sym("@variable.builtin") },   -- Variable from default library
    sym("@lsp.typemod.function.defaultLibrary") { sym("@function.builtin") },   -- Function from default library
    sym("@lsp.typemod.method.defaultLibrary") { sym("@function.builtin") },     -- Method from default library
    sym("@lsp.typemod.macro.defaultLibrary") { sym("@function.builtin") },      -- Macro from default library
    sym("@lsp.typemod.struct.defaultLibrary") { sym("@type.builtin") },         -- Struct from default library
    sym("@lsp.typemod.enum.defaultLibrary") { sym("@type.builtin") },           -- Enum from default library
    sym("@lsp.typemod.enumMember.defaultLibrary") { sym("@constant.builtin") }, -- Enum member from default library
    sym("@lsp.typemod.variable.readonly") { fg = colors.blue },                 -- Read-only variable
    sym("@lsp.typemod.variable.callable") { sym("@function") },                 -- Callable variable (e.g., function pointer)
    sym("@lsp.typemod.variable.static") { sym("@constant") },                   -- Static variable
    sym("@lsp.typemod.property.readonly") { fg = colors.blue },                 -- Read-only property
    sym("@lsp.typemod.keyword.async") { sym("@keyword.coroutine") },            -- Async keyword

    sym("@lsp.typemod.keyword.injected") { sym("@keyword") },                   -- Injected keyword (e.g., via dependency injection)
    sym("@lsp.typemod.operator.injected")({ sym("@operator") }),                -- Injected operator by tooling
    sym("@lsp.typemod.string.injected")({ sym("@string") }),                    -- Injected string (e.g., in templates)
    sym("@lsp.typemod.variable.injected")({ sym("@variable") }),                -- Injected variable by tooling

    -- Language Specific
    -- Lua
    sym("@variable.member.lua") { fg = colors.teal },              -- Object and struct fields in lua
    sym("@lsp.type.property.lua") { sym("@variable.member.lua") }, -- Object or class property in lua

    -- Python
    sym("@type.builtin.python") { sym("@type") },         -- built-in types
    sym("@lsp.type.builtinType.python") { sym("@type") }, -- Built-in type (e.g., int, float)

    -- Markdown
    sym("@label.markdown") { fg = colors.pink },                      -- GOTO and other labels, including heredoc labels
    sym("@markup.raw.markdown_inline") { fg = colors.yellow_orange }, -- GOTO and other labels, including heredoc labels

    -- Vimdoc
    sym("@label.vimdoc") { fg = colors.red, italic = true, underline = true }, -- GOTO and other labels, including heredoc labels

    -- SymbolKind
    SymbolKindText { fg = "#cccccc", bg = colors.none },   -- Default text style (fallback)
    SymbolKindMethod { fg = "#b180d7", bg = colors.none }, -- Instance methods
    SymbolKindFunction { SymbolKindMethod },               -- Functions (same as methods)
    SymbolKindField { fg = "#75beff", bg = colors.none },  -- Class/struct fields
    SymbolKindVariable { SymbolKindField },                -- Variables (same as fields)
    SymbolKindClass { fg = "#ee9d28", bg = colors.none },  -- Classes / user-defined types
    SymbolKindInterface { SymbolKindField },               -- Interfaces (same as fields)
    SymbolKindModule { SymbolKindText },                   -- Modules / containers
    SymbolKindProperty { SymbolKindText },                 -- Object properties
    SymbolKindUnit { SymbolKindText },                     -- Unit types
    SymbolKindValue { SymbolKindText },                    -- Values / constants
    SymbolKindEnum { SymbolKindClass },                    -- Enums (styled as classes)
    SymbolKindKeyword { SymbolKindText },                  -- Language keywords
    SymbolKindSnippet { SymbolKindText },                  -- Code snippets
    SymbolKindColor { SymbolKindText },                    -- Color literals
    SymbolKindFile { SymbolKindText },                     -- Files
    SymbolKindReference { SymbolKindText },                -- References / aliases
    SymbolKindFolder { SymbolKindText },                   -- Folders / directories
    SymbolKindEnumMember { SymbolKindField },              -- Enum members (same as fields)
    SymbolKindConstant { SymbolKindText },                 -- Constants
    SymbolKindStruct { SymbolKindText },                   -- Structs
    SymbolKindEvent { SymbolKindClass },                   -- Events (styled as classes)
    SymbolKindOperator { SymbolKindText },                 -- Operators (+, -, etc.)
    SymbolKindTypeParameter { SymbolKindText },            -- Generic type parameters
    SymbolKindArray { SymbolKindText },                    -- Arrays
    SymbolKindBoolean { SymbolKindText },                  -- Boolean literals
    SymbolKindKey { SymbolKindText },                      -- Keys in key-value pairs
    SymbolKindNamespace { SymbolKindText },                -- Namespaces
    SymbolKindString { SymbolKindText },                   -- String literals
    SymbolKindNull { SymbolKindText },                     -- Null / nil literals
    SymbolKindNumber { SymbolKindText },                   -- Number literals
    SymbolKindObject { SymbolKindText },                   -- Generic objects
    SymbolKindPackage { SymbolKindText },                  -- Packages / dependencies

    -- Indent Blankline
    IblIndent { fg = colors.indent_guide }, -- Indent Blankline: Indent Guide
    IblScope { fg = colors.indent_scope },  -- Indent Blankline: Indent Scope

    -- Rainbow Delimiters
    RainbowDelimiterYellow { fg = "#e8ba36" }, -- Rainbow Delimiters: Yellow
    RainbowDelimiterGreen { fg = "#54a857" },  -- Rainbow Delimiters: Green
    RainbowDelimiterBlue { fg = "#359ff4" },   -- Rainbow Delimiters: Blue
    RainbowDelimiterViolet { fg = "#6e7ed9" }, -- Rainbow Delimiters: Violet
    RainbowDelimiterCyan { fg = "#4ec9b0" },   -- Rainbow Delimiters: Cyan
    RainbowDelimiterRed { fg = "#f85149" },    -- Rainbow Delimiters: Red
    RainbowDelimiterOrange { fg = "#f9ae28" }, -- Rainbow Delimiters: Orange

    -- VirtColumn
    VirtColumn { fg = colors.indent_guide, bg = colors.none }, -- VirtualColumn

    -- RenderMarkdown
    RenderMarkdownMath { fg = colors.teal },                             -- Render LaTeX or math blocks
    RenderMarkdownH1Bg { bg = Normal.bg },                               -- Background for H1 headers
    RenderMarkdownH2Bg { bg = Normal.bg },                               -- Background for H2 headers
    RenderMarkdownH3Bg { bg = Normal.bg },                               -- Background for H3 headers
    RenderMarkdownH4Bg { bg = Normal.bg },                               -- Background for H4 headers
    RenderMarkdownH5Bg { bg = Normal.bg },                               -- Background for H5 headers
    RenderMarkdownH6Bg { bg = Normal.bg },                               -- Background for H6 headers
    RenderMarkdownH1 { sym("@markup.heading.1") },                       -- Text color/style for H1 headers
    RenderMarkdownH2 { sym("@markup.heading.2") },                       -- Text color/style for H2 headers
    RenderMarkdownH3 { sym("@markup.heading.3") },                       -- Text color/style for H3 headers
    RenderMarkdownH4 { sym("@markup.heading.4") },                       -- Text color/style for H4 headers
    RenderMarkdownH5 { sym("@markup.heading.5") },                       -- Text color/style for H5 headers
    RenderMarkdownH6 { sym("@markup.heading.6") },                       -- Text color/style for H6 headers
    RenderMarkdownCode { bg = "#151515" },                               -- Code block background or style
    RenderMarkdownCodeInfo { bg = Normal.bg },                           -- Language info in fenced code blocks (e.g., ```js)
    RenderMarkdownCodeBorder { RenderMarkdownCode },                     -- Border or edge around code blocks
    RenderMarkdownCodeFallback { RenderMarkdownCode },                   -- Style for code when language is not detected
    RenderMarkdownCodeInline { bg = Normal.bg },                         -- Inline `code` style
    RenderMarkdownDash { VertSplit },                                    -- Horizontal rules (---)
    RenderMarkdownBullet { sym("@markup.list") },                        -- Bullets in lists (*, -, +)
    RenderMarkdownUnchecked { sym("@markup.list.unchecked") },           -- Unchecked task list items [-]
    RenderMarkdownChecked { sym("@markup.list.checked") },               -- Checked task list items [x]
    RenderMarkdownTodo { Todo },                                         -- TODO items (emphasized)
    RenderMarkdownQuote { sym("@markup.quote") },                        -- Generic quote block style
    RenderMarkdownQuote1 { RenderMarkdownQuote },                        -- Quote level 1 (>)
    RenderMarkdownQuote2 { RenderMarkdownQuote },                        -- Quote level 2 (>>)
    RenderMarkdownQuote3 { RenderMarkdownQuote },                        -- Quote level 3 (>>>)
    RenderMarkdownQuote4 { RenderMarkdownQuote },                        -- Quote level 4
    RenderMarkdownQuote5 { RenderMarkdownQuote },                        -- Quote level 5
    RenderMarkdownQuote6 { RenderMarkdownQuote },                        -- Quote level 6
    RenderMarkdownTableHead { fg = colors.dark_blue },                   -- Table header row
    RenderMarkdownTableRow { fg = colors.dark_blue },                    -- Table body rows
    RenderMarkdownTableFill { bg = Normal.bg },                          -- Filler or padding inside table cells
    RenderMarkdownInfo { DiagnosticInfo },                               -- Info-style block
    RenderMarkdownSuccess { DiagnosticOk },                              -- Success-style block
    RenderMarkdownHint { DiagnosticHint },                               -- Hint or tip blocks
    RenderMarkdownWarn { DiagnosticWarn },                               -- Warning blocks
    RenderMarkdownError { DiagnosticError },                             -- Error or danger blocks
    RenderMarkdownLink { fg = colors.dark_blue },                        -- Regular Markdown links
    RenderMarkdownWikiLink { fg = colors.dark_blue },                    -- Wiki-style links
    RenderMarkdownSign { fg = colors.violet },                             -- Signature or blockquote footer
    RenderMarkdownInlineHighlight { bg = "#2c3c86", fg = colors.white }, -- Inline emphasis/highlight
    RenderMarkdownIndent { fg = colors.indent_guide },                   -- Indentation guides or markers
    RenderMarkdownHtmlComment { Comment },                               -- HTML comments in Markdown
  }
end)

return theme
