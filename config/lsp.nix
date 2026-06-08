{
  vim = {
    languages = {
      enableFormat = true;
      enableTreesitter = true;
      enableExtraDiagnostics = true;

      nix = {
        enable = true;
        format.type = ["nixfmt"];
      };
      markdown.enable = true;
      lua.enable = true;
    };

    lsp = {
      enable = true;
      formatOnSave = true;
      # lspkind.enable = false;
      # lightbulb.enable = true;
      # lspsaga.enable = false;
      # trouble.enable = true;
      # lspSignature.enable = true;
      # otter-nvim.enable = true;
      # nvim-docs-view.enable = true;
    };
  };
}
