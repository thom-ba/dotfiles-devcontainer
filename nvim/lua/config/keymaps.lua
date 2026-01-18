local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Telescope mappings
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Go to definition
map("n", "gd", "<Plug>(coc-definition)", opts)
-- Go to type definition
map("n", "gy", "<Plug>(coc-type-definition)", opts)
-- Go to implementation
map("n", "gi", "<Plug>(coc-implementation)", opts)
-- Go to references
map("n", "gr", "<Plug>(coc-references)", opts)

-- Tree toggle
map("n", "<leader>t", "<cmd>:Neotree toggle<CR>", opts)
-- Show code actions
map("n", "<leader>caf", ":CocAction<CR>", opts)

-- Jump to next/prev diagnostic
map("n", "<leader>cej", "<Plug>(coc-diagnostic-next)", opts)
map("n", "<leader>cek", "<Plug>(coc-diagnostic-prev)", opts)

-- Show diagnostics for current line
map("n", "<leader>cae", ":CocShowLineDiagnostics<CR>", opts)

-- Open location list with all diagnostics
map("n", "<leader>cel", ":CocList diagnostics<CR>", opts)

map ("n", "<leader>cad)", ":call ShowDocumentation()<CR>", opts)

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
map("n", "<leader>cad", "<CMD>lua _G.show_docs()<CR>", opts)

vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
