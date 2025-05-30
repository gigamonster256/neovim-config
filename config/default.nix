{ pkgs, ... }:
{
  imports = [
    ./options.nix
    ./keybinds.nix
    ./theme.nix
    ./lsp.nix
    ./assistant.nix
    ./visuals.nix
  ];

  vim = {
    viAlias = true;
    vimAlias = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };

    notes.todo-comments = {
      enable = true;
      setupOpts = {
        signs = false;
      };
    };

    binds.whichKey.enable = true;

    telescope.enable = true;
    utility.oil-nvim.enable = true;

    lazy.plugins =
      let
        inherit (pkgs.vimPlugins) vim-sleuth;
      in
      {
        vim-sleuth = {
          package = vim-sleuth;
        };
      };

    luaConfigRC.autocmds =
      # lua
      ''
        vim.api.nvim_create_autocmd('TextYankPost', {
          desc = 'Highlight when yanking (copying) text',
          group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
          callback = function()
            vim.highlight.on_yank()
          end,
        })
      '';
  };
}
