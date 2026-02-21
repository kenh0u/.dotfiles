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
      if [ "$TERM" != "dumb" ]; then
        PROMPT_COLOR="1;31m"
        ((UID)) && PROMPT_COLOR="1;32m"
        PS1="\n\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
      fi

      if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
      fi
    '';
  };
}
