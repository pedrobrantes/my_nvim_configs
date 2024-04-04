local telescope = require('telescope')

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      '%.png',
      '%.webp',
      '%.jpg',
      '%.jpeg',
      '.git/',
      'node_modules/',
      '.vscode/',
      '.obsidian/',
      '%.Rprofile',
      '%.Rhistory',
    }
  }
}
