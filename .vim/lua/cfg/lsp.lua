local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs") -- Make sure this is a slash (as theres some metamagic happening behind the scenes)

--[[
if not lspconfig.teal then
   configs.teal = {
      default_config = {
         cmd = {
            "teal-language-server",
            -- "logging=on", use this to enable logging in /tmp/teal-language-server.log
         },
         filetypes = {
            "teal",
            -- "lua", -- Also works for lua, but you may get type errors that cannot be resolved within lua itself
         },
         root_dir = lspconfig.util.root_pattern("tlconfig.lua", ".git"),
         settings = {},
      },
   }
end

lspconfig.teal.setup{}
]]--

-- Setup lspconfig.
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
if not lspconfig.zls then
   lspconfig.zls.setup {}
end

if not lspconfig.gopls then
   lspconfig.gopls.setup {}
end
