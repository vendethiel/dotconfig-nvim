return {
  'nvim-mini/mini.nvim',
  version = false,
  config = function ()
    -- Icons
    require("mini.icons").setup()

    -- Basics
    require("mini.basics").setup()

    -- AI
    require("mini.ai").setup()
    -- AI provides `an`/`al` (and `in`/`il`) for next/last
    -- from the docs:
    -- > NOTE: with default config, built-in LSP mappings v_an and v_in on Neovim>=0.12 are overridden.
    -- > Either use different around_next / inside_next keys or map manually using vim.lsp.buf.selection_range(). [...]
    vim.keymap.del({"x", "o"}, "a")
    vim.keymap.del({"x", "o"}, "i")

    -- Align
    require("mini.align").setup()

    -- Comment
    require("mini.comment").setup()
    -- Ignore conflict between gcc and gc, latter accepts object (eg. `gcip` inside paragraph)

    -- Completion
    require("mini.completion").setup()

    -- Keymap
    -- Imitate spacemacs `fg`
    local map_combo = require('mini.keymap').map_combo
    local mode = { "i", "c", "x", "s" }
    map_combo(mode, "fg", "<BS><BS><Esc>")
    map_combo(mode, "gf", "<BS><BS><Esc>")

    -- Move
    -- require("mini.move").setup()
    -- Disables `gr*` LSP mappings, is it really worth it?

    -- Pairs
    require("mini.pairs").setup()

    -- Snippets
    -- local gen_loader = require('mini.snippets').gen_loader
    -- require('mini.snippets').setup({
    --   snippets = {
    --     -- Load custom file with global snippets first (adjust for Windows)
    --     gen_loader.from_file('~/.config/nvim/snippets/global.json'),
    --     -- Load snippets based on current language by reading files from
    --     -- "snippets/" subdirectories from 'runtimepath' directories.
    --     gen_loader.from_lang(),
    --   },
    -- })


    -- Surround
    require("mini.surround").setup {
      -- using `gs` prefix because `s` doesn't work..?
      mappings = {
        add = 'gsa', -- Add surrounding in Normal and Visual modes
        delete = 'gsd', -- Delete surrounding
        find = 'gsf', -- Find surrounding (to the right)
        find_left = 'gsF', -- Find surrounding (to the left)
        highlight = 'gsh', -- Highlight surrounding
        replace = 'gsr', -- Replace surrounding

        suffix_last = 'l', -- Suffix to search with "prev" method
        suffix_next = 'n', -- Suffix to search with "next" method
      },
    }

    -- Bracketed
    require("mini.bracketed").setup()

    -- Extra
    require("mini.extra").setup()

    -- Git
    require("mini.git").setup()

    -- Sessions
    require("mini.sessions").setup()

    -- Indentscope
    require("mini.indentscope").setup()

    -- Starter
    require("mini.starter").setup()

    -- Statusline
    require("mini.statusline").setup()

    -- Tabline
    require("mini.tabline").setup()

    -- Trailspace
    require("mini.trailspace").setup()

    -- Splitjoin - why?
    -- require("mini.splitjoin").setup()

    -- Clue -- not sure what it's supposed to be useful for, looks like it's heavy on conflicts
    -- require('mini.clue').setup()
    -- Deps -- not sure what it's supposed to be useful for? LSP plugin configuration?
    -- require('mini.deps').setup()
    -- Diff - no need
    -- require('mini.diff').setup()
    -- Files -- use fzf instead
    -- require('mini.files').setup()
    -- Jump -- I'm fine with single line fFtT
    -- require('mini.jump').setup()
    -- Jump2d -- not my cup of tea
    -- require('mini.jump2d').setup()
    -- Pick -- interesting for later, perhaps
    -- require('mini.pick').setup()
    -- Visits - no need
    -- require('mini.visits').setup()
  end,
}
