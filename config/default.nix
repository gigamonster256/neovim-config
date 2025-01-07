{vimPlugins}: {
  imports = [
    ./options.nix
    ./keybinds.nix
    ./theme.nix
    ./lsp.nix
  ];

  vim = {
    viAlias = true;
    vimAlias = true;
    disableArrows = true;

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

    lazy.plugins = let
      inherit (vimPlugins) vim-sleuth oil-nvim nvim-web-devicons;
    in {
      vim-sleuth = {
        package = vim-sleuth;
      };

      "oil.nvim" = {
        package = oil-nvim;
        setupModule = "oil";
      };

      nvim-web-devicons = {
        package = nvim-web-devicons;
      };
    };

    luaConfigRC.autocmds =
      /*
      lua
      */
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
