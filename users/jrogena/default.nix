{ pkgs, ... }:
  let
    homeParentDir = "/home"; # TODO: Make this an argument
    username = "jrogena";
  in {
  home = {
    stateVersion = "24.11";
    username = username;
    homeDirectory = "${homeParentDir}/${username}";
  };
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Jason Rogena";
    userEmail = "null+gitnub.com@rogena.me";
  };
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
      EDITOR = "vim";
    };
  };
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
