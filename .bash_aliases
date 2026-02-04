shopt -s expand_aliases

alias la='ls -a'
alias ll='ls -l'
alias lal='ls -al'
alias bd='cd $OLDPWD'
alias ..='cd ..'

alias yt-mp4='yt-dlp --add-metadata -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]" --cookies ~/.youtube.com_cookies.txt'
alias yt-webm='yt-dlp --add-metadata -f "bestvideo[ext=webm]+bestaudio[ext=webm]" --cookies ~/.youtube.com_cookies.txt'
alias yt-best='yt-dlp --add-metadata -f "bestvideo+bestaudio" --cookies ~/.youtube.com_cookies.txt'
alias yt-live='yt-dlp --wait-for-video 0 --add-metadata -f "b" --cookies ~/.youtube.com_cookies.txt'
alias yt-live-fs='yt-dlp --wait-for-video 0 --live-from-start --add-metadata -f "bestvideo+bestaudio" --cookies ~/.youtube.com_cookies.txt'
alias yt-lf='yt-dlp --list-formats --cookies ~/.youtube.com_cookies.txt'
alias yt-d='yt-dlp --add-metadata --cookies ~/.youtube.com_cookies.txt'

wsl(){
  alias pbcopy='win32yank.exe -i'
  alias pbpaste='win32yank.exe -o'
  function open() { 
    if [ $# -lt 1 ]; then
      cmd.exe /c start $(wslpath -w .) &> /dev/null
    else
      cmd.exe /c start $(wslpath -w $1) &> /dev/null
    fi
  }
}

linux(){
  alias pbcopy='xsel --clipboard --input'
  alias pbpaste='xsel --clipboard --output 2> /dev/null'
}

mac(){
  alias rmprov='rm ~/Library/Developer/Xcode/UserData/Provisioning\ Profiles/*.mobileprovision'
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

