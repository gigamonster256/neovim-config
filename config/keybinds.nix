{
  vim = let
    map = key: action: {
      inherit key action;
      mode = "n";
    };
    mapOpts = key: action: opts: map key action // opts;
    mapDesc = key: action: desc: mapOpts key action {inherit desc;};
  in {
    keymaps =
      [
        (map "<Esc>" "<cmd>nohlsearch<CR>")
        (mapOpts "<Esc><Esc>" "<C-\\><C-n>" {
          mode = "t";
          desc = "Exit terminal mode";
        })
        (mapDesc "<C-h>" "<C-w><C-h>" "Go to the left window")
        (mapDesc "<C-j>" "<C-w><C-j>" "Go to the down window")
        (mapDesc "<C-k>" "<C-w><C-k>" "Go to the up window")
        (mapDesc "<C-l>" "<C-w><C-l>" "Go to the right window")
      ]
      ++
      # disable arrrows for movement
      builtins.map (dir:
        mapOpts dir "<nop>" {
          noremap = false;
          mode = ["n" "i"];
        }) ["<up>" "<down>" "<left>" "<right>"];
  };
}
