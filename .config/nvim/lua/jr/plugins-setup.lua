local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerCompile
  augroup end
]])


local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    use("folke/tokyonight.nvim")
    use("nvim-lua/plenary.nvim")
    use {
     'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons 
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use {
      'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use("nvim-telescope/telescope.nvim")
    use({"nvim-telescope/telescope-fzf-native.nvim", run = "make" })

    -- auto completion
    use({"hrsh7th/nvim-cmp"})
    use({"hrsh7th/cmp-buffer"})
    use({"hrsh7th/cmp-path"})

    -- snippets
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
    use("saadparwaiz1/cmp_luasnip")
    use("rafamadriz/friendly-snippets")
    
    -- lsp management
    use("williamboman/mason.nvim")
    use("williamboman/mason-lspconfig.nvim")
    
    -- config lsp
    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use({ "glepnir/lspsaga.nvim", branch = "main"})
    use("jose-elias-alvarez/typescript.nvim")
    use("onsails/lspkind.nvim")

    use("windwp/nvim-autopairs")
    if packer_bootstrap then
        require("packer").sync()
    end
end)
