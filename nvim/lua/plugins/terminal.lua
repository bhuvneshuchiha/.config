return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {},

  require("toggleterm").setup({
    -- size can be a number or function which is passed the current terminal
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[\\]], -- or { [[<c-\>]], [[<c-¥>]] } if you also use a Japanese keyboard.
    on_create = function(term) end, -- function to run when the terminal is first created
    on_open = function(term) end, -- function to run when the terminal opens
    on_close = function(term) end, -- function to run when the terminal closes
    on_stdout = function(term, job, data, name) end, -- callback for processing output on stdout
    on_stderr = function(term, job, data, name) end, -- callback for processing output on stderr
    on_exit = function(term, job, exit_code, name) end, -- function to run when terminal process exits
    hide_numbers = true, -- hide the number column in toggleterm buffers
    shade_filetypes = {},
    autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
    highlights = {
      -- highlights which map to a highlight group name and a table of it's values
      -- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
      Normal = {
        guibg = "black",
      },
      NormalFloat = {
        link = "Normal",
      },
      FloatBorder = {
        guifg = "black",
        guibg = "white",
      },
    },
    shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
    shading_factor = "15", -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
    start_in_insert = true,
    insert_mappings = true, -- whether or not the open mapping applies in insert mode
    terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
    persist_size = true,
    persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
    direction = "horizontal", -- 'vertical' | 'horizontal' | 'tab' | 'float'
    close_on_exit = true, -- close the terminal window when the process exits
    -- Change the default shell. Can be a string or a function returning a string
    shell = vim.o.shell,
    auto_scroll = true, -- automatically scroll to the bottom on terminal output
    -- This field is only relevant if direction is set to 'float'
    float_opts = {
      -- The border key is *almost* the same as 'nvim_open_win'
      -- see :h nvim_open_win for details on borders however
      -- the 'curved' border is a custom border type
      -- not natively supported but implemented in this plugin.
      border = "single", -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
      -- like `size`, width, height, row, and col can be a number or function which is passed the current terminal
      width = 80,
      height = 20,
      row = 5,
      col = 5,
      winblend = 3,
      zindex = 50,
      title_pos = "left", -- 'left' | 'center' | 'right', position of the title of the floating window
    },
    winbar = {
      enabled = false,
      name_formatter = function(term) --  term: Terminal
        return term.name
      end,
    },
  }),
}
