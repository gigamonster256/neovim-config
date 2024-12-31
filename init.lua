require('globals')
require('options')
require('keymaps')
require('autocmds')

require('lazy-setup')

-- add nix specific paths/configurations if running with nix config
-- (see github.com/gigamonster256/nix-config)
pcall(require, 'nix')
