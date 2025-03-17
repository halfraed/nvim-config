return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons'
        }
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
}
