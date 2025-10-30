return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    workspaces = {
      {
        name = 'Work',
        path = '~/Documents/Notes',
      },
    },
    daily_notes = {
      folder = 'dailies',
      date_format = '%Y-%m-%d-%a',
      alias_format = '%B %-d, %Y',
      default_tags = { 'daily-notes' },
      template = nil,
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    mappings = {
      --- "Obsidian follow"
      ['<leader>mf'] = {
        action = function()
          return require('obsidian').util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
        desc = 'Follow Obsidian links',
      },
      --- Checkbox toggle "Obsidian done"
      ['<leader>md'] = {
        action = function()
          return require('obsidian').util.toggle_checkbox()
        end,
        opts = { buffer = true },
        desc = 'Toggle Obsidian Checkbox',
      },
    },
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      local suffix = ''
      if title ~= nil then
        -- If title is given, transform it into valid file name.
        suffix = title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
      else
        -- If title is nil, just add 4 random uppercase letters to the suffix.
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. '-' .. suffix
    end,
    templates = {
      subdir = 'Templates',
      date_format = '%Y-%m-%d-%a',
      time_format = '%H:%M',
      tags = '',
    },
    tag_mappings = {
      -- Add tag(s) to current note.
      tag_note = '<C-x>',
      -- Insert a tag at the current location.
      insert_tag = '<C-l>',
    },
  },
}
