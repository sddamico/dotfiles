# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="blinks"

ENABLE_CORRECTION="true"

# zsh plugins
plugins=(git osx adb atom brew github gradle jira jsontools jump)

source $ZSH/oh-my-zsh.sh

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export ANDROID_HOME=/Users/stephen/android-sdk
export ANDROID_TOOLS=$ANDROID_HOME/tools
export ANDROID_PLATFORM_TOOLS=$ANDROID_HOME/platform-tools
export TOOLS_DIR=~/tools
export GROOVY_HOME=/usr/local/opt/groovy/libexec

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS:$PATH"
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR='vim'

ghpr() {
  read -p "Base [develop]: " base
  if [ -z "$base_branch" ]; then
    base_branch="develop";
  fi

  branch_name=`git symbolic-ref --short HEAD`

  open "https://github.com/seatgeek/android-app/compare/$base_branch...$branch_name?expand=1"
}

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
