-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
-- File Explorer in Vim Ctrl+f
 {
 "nvim-telescope/telescope-file-browser.nvim",
 dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
 };
-- Use Ctrl+fp to list recent git projects
  "ahmedkhalf/project.nvim",
-- alpha dashboard
  {
  'goolord/alpha-nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
  end
  };
  "jvgrootveld/telescope-zoxide",
  -- Colorschemes
  "lunarvim/darkplus.nvim",
  "arcticicestudio/nord-vim",
  "emacs-grammarly/lsp-grammarly",
-- Quick word search under cursor alt+p and alt+n
  "RRethy/vim-illuminate",
-- Titus Custom
  "postfen/clipboard-image.nvim",
  "mbbill/undotree",
--  "wakatime/vim-wakatime",
  "Pocco81/auto-save.nvim",
  "Pocco81/true-zen.nvim",
  "lambdalisue/suda.vim",
  "lunarvim/synthwave84.nvim",
  "github/copilot.vim",

-- Erki's additions
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  -- {
  --   "kdheepak/lazygit.nvim",
  --   -- optional for floating window border decoration
  --   dependencies = {
  --       "nvim-lua/plenary.nvim",
  --   },
  -- },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      lazygit = {},
      notifier = {
        enabled = true,
        timeout = 2000,
      },
    },
    keys = {
      { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "Personal",
          path = "~/OneDrive/Obsidian",
        },
        {
          name = "Work",
          path = "~/Documents/Notes",
        },
      },
      conceallevel = 1,
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },
      mappings = {
        --- "Obsidian follow"
        ["<leader>of"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        --- Checkbox toggle "Obsidian done"
        ["<leader>od"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
      note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
          -- If title is given, transform it into valid file name.
          suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
          -- If title is nil, just add 4 random uppercase letters to the suffix.
          for _ = 1, 4 do
            suffix = suffix .. string.char(math.random(65, 90))
          end
        end
        return tostring(os.time()) .. "-" .. suffix
      end,
      templates = {
        subdir = "Templates",
        date_format = "%Y-%m-%d-%a",
        time_format = "%H:%M",
        tags = "",
      },
    },
  },
}
