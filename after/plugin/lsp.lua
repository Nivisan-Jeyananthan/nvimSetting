local lsp = require('lsp-zero')



lsp.on_attach(function(client, bufnr)

	lsp.default_keymaps({buffer = bufnr})

end)

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
	['<C-y>'] = cmp.mapping.confirm({ select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})
cmp.setup({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	sign_icons = { } 
})

require('lspconfig').csharp_ls.setup{}
