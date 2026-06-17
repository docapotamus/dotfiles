-- general
vim.g.mapleader = ","

-- line numbers
vim.o.number = true          -- absolute number on the current line
vim.o.relativenumber = true  -- relative offsets on all other lines
vim.o.signcolumn = "yes"   -- always reserve the sign column, no horizontal jitter

vim.keymap.set("n", "<leader>cr", "<cmd>source $MYVIMRC<cr>", { desc = "Reload config" })

-- telescope
vim.pack.add({
  { src = "https://github.com/nvim-lua/plenary.nvim" },
  { src = "https://github.com/nvim-telescope/telescope.nvim" },
})

require("telescope").setup({})

-- keymaps (vim.pack won't define these for you either)
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags,  { desc = "Help tags" })
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document symbols" })
vim.keymap.set("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { desc = "Workspace symbols" })
vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "References" })
vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Go to definition" })
vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Implementations" })

-- gruvbox
vim.pack.add({
  { src = "https://github.com/ellisonleao/gruvbox.nvim" },
})

vim.o.background = "dark"        -- gruvbox has dark and light variants
require("gruvbox").setup({
  contrast = "hard",   -- "hard" | "soft" | ""
  italic = { strings = false, comments = true },
  transparent_mode = false,
})
vim.cmd.colorscheme("gruvbox")

-- lua line
vim.pack.add({
  { src = "https://github.com/nvim-tree/nvim-web-devicons" },  -- optional, for icons
  { src = "https://github.com/nvim-lualine/lualine.nvim" },
})

require("lualine").setup({
  options = {
    theme = "gruvbox",   -- matches the colorscheme you set up
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        show_filename_only = true,
        mode = 0,  -- 0 = name, 1 = index, 2 = name + index
      },
    },
  },
})
vim.keymap.set("n", "<Tab>",   "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })

-- nvim-surround
vim.pack.add({
  { src = "https://github.com/kylechui/nvim-surround" },
})

require("nvim-surround").setup({})

-- gitsigns
vim.pack.add({
  { src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("gitsigns").setup({})

-- lsp
vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
})

vim.lsp.enable({
  "gopls"
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
})
vim.lsp.enable("lua_ls")

-- enable autocomplete
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.completion.enable(true, args.data.client_id, args.buf, { autotrigger = true })
  end,
})

vim.o.completeopt = "menu,menuone,noselect,popup"

-- tree-sitter
vim.pack.add({
  { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local ts = require("nvim-treesitter")

-- the declarative list — just add languages here
local want = { "go", "java", "lua", "vimdoc", "query", "markdown", "markdown_inline", "sql", "typescript" }

local have = ts.get_installed()
local missing = vim.tbl_filter(function(lang)
  return not vim.tbl_contains(have, lang)
end, want)

if #missing > 0 then
  ts.install(missing)
end

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.start)
  end,
})

