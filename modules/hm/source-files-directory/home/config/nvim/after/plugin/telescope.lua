require("telescope").setup()
local builtin = require("telescope.builtin")
vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "telescope find files"})
vim.keymap.set('n', "<leader>fg", builtin.live_grep, { desc = "telescope live grep"})
