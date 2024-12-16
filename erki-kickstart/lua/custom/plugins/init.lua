-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- File Explorer in Vim Ctrl+f
  {
  "nvim-telescope/telescope-file-browser.nvim",
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  };
  "ahmedkhalf/project.nvim",
  "jvgrootveld/telescope-zoxide",

  -- Colorschemes
  "lunarvim/darkplus.nvim",
  "arcticicestudio/nord-vim",
  "emacs-grammarly/lsp-grammarly",

  -- Quick word search under cursor alt+p and alt+n
  "RRethy/vim-illuminate",

  "mbbill/undotree",

  --  "wakatime/vim-wakatime",
  "Pocco81/auto-save.nvim",

  -- "Pocco81/true-zen.nvim",
  "lambdalisue/suda.vim",
  "lunarvim/synthwave84.nvim",
}
