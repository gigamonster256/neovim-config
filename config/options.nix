{
  vim = {
    useSystemClipboard = true;
    searchCase = "smart";
    lineNumberMode = "relNumber";
    undoFile.enable = true;
    showSignColumn = true;
    options = {
      mouse = "a";

      showmode = false;

      breakindent = true;

      updatetime = 250;
      timeoutlen = 300;

      list = true;
      listchars = "tab:»·,trail:·,nbsp:␣";

      inccommand = "split";

      cursorline = true;

      scrolloff = 10;

      colorcolumn = "80";

      guicursor = "";

      tabstop = 2;
      shiftwidth = 2;

      hlsearch = true;
    };
  };
}
