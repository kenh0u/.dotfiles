export PATH=$PATH:$HOME/.dotfiles/scripts

shopt -s expand_aliases

alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias bd='cd $OLDPWD'
alias ..='cd ..'

wsl(){
  alias pbcopy='win32yank.exe -i'
  alias pbpaste='win32yank.exe -o'
  function open() { cmd.exe /c start $(wslpath -w $1) &> /dev/null; }
}

linux(){
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output 2> /dev/null'
}

mac(){
  :
}

if [ $(uname) == 'Linux' ];then
  if [ -f /proc/sys/fs/binfmt_misc/WSLInterop ]; then
    wsl
  else
    linux
  fi
elif [ $(uname) == 'Darwin' ];then
  mac
fi

