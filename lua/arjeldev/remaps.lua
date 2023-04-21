-- Set <space> as the <leader>
vim.g.mapleader = " "

-- Open explorer
vim.keymap.set("n", "<leader>e", ":Telescope file_browser<CR>" )

-- Move selected Text in visual mode up and Down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- When press J, the line appends without changing the cursor
vim.keymap.set("n", "J", "mzJ`z")

-- Navigates with <C-d/u> and center automatically
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When searching text and press <CR> n and N cicles trough and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Yank to Clipboard, NOTE: Do <leader>yap to copy Paragraph!
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- Deletes without affecting the register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Disables Q
vim.keymap.set("n", "Q", "<nop>")

-- Format the entire file with the LSP
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Reaplace all ocurrences of the hovered word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Set React Extract snippet
vim.keymap.set({ "v" }, "<Leader>re", require("react-extract").extract_to_new_file)
vim.keymap.set({ "v" }, "<Leader>rc", require("react-extract").extract_to_current_file)

-- Source the current file, Pretty neat!
vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)
