local status, rt = pcall(require, "rust-tools")
if not status then
    return
end

rt.setup({
    server = {
        on_attach = function(_, bufnr)
        vim.keymap.set("n", "<X-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
        vim.keymap.set("n", "<leader>a"m rt.code_action_group.code_action_group, { buffer = bufnr })
        end
    }
})
