{ config, pkgs, ... }:

{
  home.username = "kenhou";
  home.homeDirectory = "/home/kenhou";
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fzf ripgrep jq tree
  ];

  home.file.".bash_aliases".source = ./.bash_aliases;
  home.file.".vimrc".source = ./.vimrc;
  home.file.".tmux.conf".source = ./.tmux.conf;
  home.file.".screenrc".source = ./.screenrc;
  home.file.".config/nvim/init.vim".source = ./.config/nvim/init.vim;
  home.file.".config/git/ignore".source = ./.config/git/ignore;

  programs.git = {
    enable = true;
    includes = [ { path = "${config.home.homeDirectory}/.dotfiles/.gitconfig"; } ];
  };
}
