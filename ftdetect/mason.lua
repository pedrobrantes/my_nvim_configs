local mason = require('mason')
local masonlsp = require('mason-lspconfig')

mason.setup()
masonlsp.setup({
  automatic_installation = true,
})
