return {
    "nvimdev/lspsaga.nvim",
    config = function()
        require("lspsaga").setup({
            ui = {
                foldericon = false,
            },
            lightbulb = {
                enable = false,
            },
            symbol_in_winbar = {
                show_file = false,
                folder_level = 0,
            },
        })
    end,
    dependencies = {
        "nvim-treesitter/nvim-treesitter", -- optional
        "nvim-tree/nvim-web-devicons", -- optional
    },
}
