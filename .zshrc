# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"

ENABLE_CORRECTION="true"

# zsh plugins
plugins=(git osx adb brew github gradle jira jsontools jump)

source $ZSH/oh-my-zsh.sh

export JAVA_HOME=`/usr/libexec/java_home -v 21`
export GROOVY_HOME=/opt/homebrew/groovy/libexec
export ANDROID_HOME=/opt/homebrew/opt/android-sdk
export ANDROID_TOOLS=$ANDROID_HOME/tools
export NDK=$ANDROID_HOME/ndk-bundle
export ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools
export TOOLS_DIR=~/tools
export USER_BIN_DIR=~/bin

# path config...
export PATH="/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$PATH"
export PATH="$TOOLS_DIR:$USER_BIN_DIR:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$PATH:$TOOLS_DIR/dex-method-count/dex-method-counts/"
export PATH="/opt/homebrew/heroku/bin:$PATH"
export PATH="$PATH:/opt/homebrew/Cellar/adoptopenjdk-openjdk8"

export EDITOR='vim'

ghpr() {
  read -p "Base [develop]: " base
  if [ -z "$base_branch" ]; then
    base_branch="develop";
  fi

  branch_name=`git symbolic-ref --short HEAD`

  open "https://github.com/seatgeek/android-app/compare/$base_branch...$branch_name?expand=1"
}

install_android() {
  spawn android update sdk --no-ui --force
  match_max 1000000
  # Look for prompt
  expect "*android-sdk-license*"
  # Accept the prompt
  send -- "yes\r"
  # Look for prompt
  expect "*google-gdk-license*"
  # Accept the prompt
  send -- "yes\r"
  # Look for prompt
  expect "*intel-android-extra-license*"
  # Accept the prompt
  send -- "yes\r"
  # send blank line (\r) to make sure we get back to gui
  send -- "\r"
  expect eof
}

update_android() {
  android update sdk --no-ui --force
}

gistd() {
  echo "Git diff gist-er\nRef 1: "
  read ref1
  echo "Ref 2: "
  read ref2
  echo "Filename: "
  read name
  git diff $ref1..$ref2 | gist -f $name.diff
}

gistp() {
  if [ -z "$1" ] ; then
    echo "Must supply filename for new gist"
    exit(1)
   else
     gisturl=$(pbpaste | gist -f $1)
     echo "Copying $gisturl to clipboard"
     echo "$gisturl" | pbcopy
  fi
}

adbr() {
  adb kill-server && adb start-server
}

android_backup() {
  adb backup -apk -shared -all -nosystem -f "${HOME}/android-backups/backup-$(date "+%Y-%m-%d-%H%M%S").ab"
}

brewu() {
  brew update && brew upgrade && brew upgrade --cask && brew cleanup
}

fancy-ctrl-z () {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

to-gif() {
  ffmpeg -i "$1" -vf scale=320:-1 -f image2pipe -vcodec ppm - | convert -delay 5 -loop 0 - "$2.gif"
}

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"


nuke-gradle() {
  jps|grep -E 'KotlinCompileDaemon|GradleDaemon'| awk '{print $1}'| xargs kill -9
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
