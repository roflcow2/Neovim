return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
        { "<leader>a", function() harpoon:list():append() end },
        { "<leader>L", function() harpoon:list():next() end },
        { "<leader>H", function() harpoon:list():prev() end },
        { "<leader>1", function() harpoon:list():select(1) end },
        { "<leader>2", function() harpoon:list():select(2) end },
        { "<leader>3", function() harpoon:list():select(3) end },
        { "<leader>4", function() harpoon:list():select(4) end },
    },
    config = function()
        harpoon = require("harpoon")
        harpoon:setup()
    end,
}
