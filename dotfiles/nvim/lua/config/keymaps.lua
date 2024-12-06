-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<leader>lg", function()
--   vim.cmd("FloatermNew --autoclose=2 lazygit")
-- end, { desc = "Open LazyGit" })

-- Ensure this is inside your keymap configuration
local map = vim.keymap.set

-- Remap Tab to go to the next buffer
-- map("n", "<Tab>", "]b", { desc = "Next buffer", noremap = true, silent = true })

-- Optional: Shift-Tab to go to the previous buffer
-- map("n", "<S-Tab>", "[b", { desc = "Previous buffer", noremap = true, silent = true })

-- Map <leader>x to close the current buffer
map("n", "<leader>x", ":bd<CR>", { desc = "Close current buffer", noremap = true, silent = true })

-- Map <leader>fz Telescope live Grep
map("n", "<leader>fz", "<cmd>Telescope live_grep<CR>", { desc = "Telescope Grep", noremap = true, silent = true })

-- Map <leader>lg LazyGit
map("n", "<leader>lg", ":terminal lazygit<CR>", { desc = "LazyGit alternative", noremap = true, silent = true })

-- Map <leader>cpmu
map("n", "<leader>cpmu", ":terminal cpm-test-unit<CR>", { desc = "Run CPM unit tests", noremap = true, silent = true })
