local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
    return
end

local typescript_status, typescript = pcall(require, "typescript")
if not typescript_status then
    return
end

local keymap = vim.keymap

-- enable keybinds for lsp server
local on_attach = function(client, bufnr)
end


