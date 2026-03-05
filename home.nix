{ config, pkgs, ... }:

{
  home.stateVersion = "25.11";
  programs.home-manager.enable = true;

  home.file.".bash_aliases".source = ./.bash_aliases;
  home.file.".vimrc".source = ./.vimrc;
  home.file.".tmux.conf".source = ./.tmux.conf;
  home.file.".config/nvim/init.vim".source = ./.config/nvim/init.vim;
  home.file.".config/git/ignore".source = ./.config/git/ignore;

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.git = {
    enable = true;
    includes = [ { path = "${./.gitconfig}"; } ];
  };

  programs.bash = {
    enable = true;
    initExtra = ''
      if [ "$TERM" != "dumb" ]; then
        _update_ps1() {
          local PROMPT_COLOR="1;31m"
          ((UID)) && PROMPT_COLOR="1;32m"

          local NIX_PROMPT=""
          if [ -n "$IN_NIX_SHELL" ] || [[ "$PATH" == /nix/store/* ]]; then
            local ENV_NAME="nix"
            if [ -n "$pname" ]; then
              ENV_NAME="$pname"
            elif [ -n "$name" ]; then
              ENV_NAME="''${name%-env}"
            fi
            NIX_PROMPT="\[\033[1;36m\]($ENV_NAME)\[\033[0m\] "
          fi

          PS1="\n$NIX_PROMPT\[\033[$PROMPT_COLOR\][\[\e]0;\u@\h: \w\a\]\u@\h:\w]\\$\[\033[0m\] "
        }

        if [[ "$PROMPT_COMMAND" != *"_update_ps1"* ]]; then
          PROMPT_COMMAND="_update_ps1; ''${PROMPT_COMMAND:-}"
        fi
      fi

      if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
      fi
    '';
  };
}
