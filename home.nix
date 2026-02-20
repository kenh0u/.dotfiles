{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.file.".bash_aliases".source = ./.bash_aliases;
  home.file.".vimrc".source = ./.vimrc;
  home.file.".tmux.conf".source = ./.tmux.conf;
  home.file.".screenrc".source = ./.screenrc;
  home.file.".config/nvim/init.vim".source = ./.config/nvim/init.vim;
  home.file.".config/git/ignore".source = ./.config/git/ignore;

  programs.git = {
    enable = true;
    includes = [ { path = "${./.gitconfig}"; } ];
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
      fi
    '';
  };
}
