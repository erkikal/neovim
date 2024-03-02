-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "J", "mzJ`z")
keymap("n", "C-d", "C-d>zz")
keymap("n", "C-u", "C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Search and replace
keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left><C-w>]])

-- Make file executable
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Better yank
keymap({"n", "v"}, "<leader>y", "\"+y")
keymap("n", "<leader>Y", "\"+Y")

-- Better delete
keymap({"n", "v"}, "<leader>d", [["_d]])

-- Easy :so
keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- Insert --
-- Press jj fast to enter
keymap("i", "jj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '>-2<CR>gv=gv")

keymap("x", "<leader>p", [["_dP]])

-- Plugins --
keymap("n", "<leader>a", ":Alpha<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fp", ":Telescope zoxide list<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<space>fe",  ":Telescope file_browser<CR>", opts)

keymap("n", "<leader>gs", vim.cmd.Git)
keymap("n", "<leader>gg", vim.cmd.LazyGit)
-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

-- Custom
-- keymap("n", "<leader>p", "<cmd> PasteImg <CR>", opts)
keymap("n", "<leader>e", "$", opts)
keymap("n", "<leader>uu", "<cmd> UndotreeToggle <CR> <cmd> UndotreeFocus <CR>", opts)
keymap("n", "<C-\\>", "<cmd> TZAtaraxis <CR>", opts)
keymap("n", "<Leader>1", "1gt<CR>", opts)
keymap("n", "<Leader>2", "2gt<CR>", opts)
keymap("n", "<Leader>3", "3gt<CR>", opts)
keymap("n", "<Leader>4", "4gt<CR>", opts)
keymap("n", "<Leader>5", "5gt<CR>", opts)
keymap("n", "<Leader>t", "<cmd> tabnew<CR>", opts)
keymap("n", "<Leader>c", "<cmd> tabclose<CR>", opts)

-- Dismiss Noice Message
keymap("n", "<leader>nd", "<cmd>NoiceDismiss<CR>", {desc = "Dismiss Noice Message"})

