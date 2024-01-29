M = {}

vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = '[W]rite', silent = true })
vim.keymap.set('n', '<leader>q', '<cmd>q<cr>', { desc = '[Q]uit', silent = true })

vim.keymap.set('n', '<leader>e', require('oil').toggle_float, { desc = 'toggle explorer' })
vim.keymap.set('n', '<leader>S', require('spectre').toggle, { desc = 'toggle spectre' })

-- Center buffer while navigating
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')
vim.keymap.set('n', 'gg', 'ggzz')
vim.keymap.set('n', 'G', 'Gzz')
vim.keymap.set('n', '%', '%zz')
vim.keymap.set('n', '*', '*zz') -- search current word forward
vim.keymap.set('n', '#', '#zz') -- search current word backward

vim.keymap.set('n', '<leader>ld', vim.diagnostic.setqflist, { desc = 'Quickfix [L]ist [D]iagnostincs' })

-- telescope
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently open files' })
vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = '[S]earch open [B]uffers' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sf', function()
  require('telescope.builtin').find_files({ hidden = true })
end, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sc', function()
  require('telescope.builtin').commands(require('telescope.themes').get_dropdown({ previewer = false }))
end, { desc = '[S]earch [C]ommand' })
vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ previewer = false }))
end, { desc = '[/] Fuzzily search in current buffer' })
vim.keymap.set('n', '<leader>ss', function()
  require('telescope.builtin').spell_suggest(require('telescope.themes').get_dropdown({ previewer = false }))
end, { desc = '[S]earch [S]pelling suggestions' })

vim.keymap.set('n', '<leader>gb', '<cmd>Gitsigns toggle_current_line_blame<cr>', { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = '[G]it [F]iles' })

M.map_lsp_keybinds = function(buffer_number)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'LSP: [R]e[N]ame', buffer = buffer_number })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'LSP: [C]ode [A]ction', buffer = buffer_number })
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'LSP: [G]o to [D]efinition', buffer = buffer_number })
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'LSP: [G]o to [D]eclaration', buffer = buffer_number })
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'LSP: Hover documentation', buffer = buffer_number })
  vim.keymap.set('n', '<leader>k', vim.lsp.buf.signature_help,
    { desc = 'LSP: Signature documentation', buffer = buffer_number })
  vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help,
    { desc = 'LSP: Signature documentation', buffer = buffer_number })
  vim.keymap.set('n', 'td', vim.lsp.buf.type_definition, { desc = 'LSP: [T]ype [D]efinition', buffer = buffer_number })


  vim.keymap.set('n', '<leader>cf', '<cmd>Format<cr>', { desc = 'LSP: [C]ode [F]ormat', buffer = buffer_number })

  -- telescope
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references,
    { desc = 'LSP: [G]oto [R]eferences', buffer = buffer_number })
  vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations,
    { desc = 'LSP: [G]oto [I]mplementations', buffer = buffer_number })
  vim.keymap.set('n', '<leader>bs', require('telescope.builtin').lsp_document_symbols,
    { desc = 'LSP: [B]uffer [S]ymbols', buffer = buffer_number })
  vim.keymap.set('n', '<leader>ps', require('telescope.builtin').lsp_workspace_symbols,
    { desc = 'LSP: [P]roject [S]ymbols', buffer = buffer_number })
end

return M
