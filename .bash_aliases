# Common shell aliases for bash. Sourced from home-manager's programs.bash.
# The WSL/macOS conditionals were dropped (2026-11-01): all remaining machines
# are NixOS hosts, and yt-dlp runs only through an LLM these days.
set -o vi
shopt -s expand_aliases

alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias bd='cd $OLDPWD'
alias ..='cd ..'

alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output 2> /dev/null'
