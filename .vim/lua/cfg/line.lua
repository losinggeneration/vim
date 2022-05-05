require('lualine').setup {
   options = {
      theme = 'gruvbox_dark',
      globalstatus = true
   },
   tabline = {
      lualine_a = {'buffers'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'},
   },
}

