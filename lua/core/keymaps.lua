-- keymaps
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Terminal
-- vim.keymap.set("n", "<leader>tt", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("n", "<leader>tt", "<cmd>FloatermToggle<CR>", { desc = "Toggle floating terminal" })
vim.keymap.set("t", "<leader>tt", "<cmd>FloatermToggle<CR>", { desc = "Toggle floating terminal" })


-- Terminal
vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle floating terminal", noremap = true, silent = true })
vim.keymap.set("t", "<A-d>", "<cmd>Lspsaga term_toggle<CR>", { desc = "Toggle floating terminal", noremap = true, silent = true })
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<leader>ls", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- Terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Enable spell checking
-- vim.opt.spell = true
vim.opt.spelllang = { 'en_us' }

-- Key mappings for spell checking
vim.keymap.set('n', '<leader>z', function()
    vim.opt.spell = not vim.opt.spell:get()
    print("Spell check " .. (vim.opt.spell:get() and "enabled" or "disabled"))
end, { desc = 'Toggle spell check' })

-- Navigation between misspelled words
vim.keymap.set('n', '[s', '<cmd>normal! [s<CR>', { desc = 'Previous misspelled word' })
vim.keymap.set('n', ']s', '<cmd>normal! ]s<CR>', { desc = 'Next misspelled word' })

-- -- Window navigation
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
--
-- -- Rivaldo split resize
-- vim.keymap.set("n", "<C-w>=", ":resize +5 <CR>", { desc = "grow" })
-- vim.keymap.set("n", "<C-w>-", ":resize -5 <CR>", { desc = "shrink" })
-- vim.keymap.set("n", "<C-w>.", ":vertical:resize +5 <CR>", { desc = "vertical grow" })
-- vim.keymap.set("n", "<C-w>,", ":vertical:resize -5 <CR>", { desc = "vertical shrink" })

vim.api.nvim_set_keymap("v", "yy", '"+y', { noremap = true, silent = false })
-- Tab navigation
vim.keymap.set("n", "tp", ":tabprevious <CR>", { desc = "prev tab" })
vim.keymap.set("n", "tn", ":tabnext <CR>", { desc = "next tab" })
vim.keymap.set("n", "td", ":tabclose <CR>", { desc = "close tab" })
vim.keymap.set("n", "tt", ":tabnew <CR>", { desc = "new tab" })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Allow moving the cursor through wrapped lines with j, k
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- clear highlights
vim.keymap.set("n", "<Esc>", ":noh<CR>", opts)

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>", opts) -- increment
vim.keymap.set("n", "<leader>-", "<C-x>", opts) -- decrement

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opt) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Tabs
-- vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
-- vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
-- vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
-- vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Press jk fast to exit insert mode
vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("i", "kj", "<ESC>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Replace word under cursor
vim.keymap.set("n", "<leader>j", "*``cgn", opts)

-- Toggle diagnostics
local diagnostics_active = true

vim.keymap.set("n", "<leader>do", function()
	diagnostics_active = not diagnostics_active

	if diagnostics_active then
		vim.diagnostic.enable(0)
	else
		vim.diagnostic.disable(0)
	end
end)
vim.keymap.set(
	"n",
	"<leader>of",
	"<cmd>ObsidianFollow<CR>",
	{ desc = "Follow Obsidian Link", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>ot",
	"<cmd>ObsidianToday<CR>",
	{ desc = "Open Today's Daily Note", noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>ob",
	"<cmd>ObsidianBacklinks<CR>",
	{ desc = "Show Obsidian Backlinks", noremap = true, silent = true }
)

-- oil
vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<leader>cl", "<CMD>Telescope colorscheme<CR>", { desc = "Open parent directory" })
