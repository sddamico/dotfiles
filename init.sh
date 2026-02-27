cd ~
services restart postgresql@17
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew tap atlassian/acli
brew tap datadog-labs/pack
brew tap varabyte/tap

brew install wget zsh git curl ffmpeg gcc go gradle \
  groovy leiningen libpng node openssl ruby python python3 redis sqlite vim \
  the_silver_searcher sloccount pidcat ctags gist jq \
  cmake imagemagick llvm gh glab heroku pgweb postgresql@17 \
  atlassian/acli/acli datadog-labs/pack/pup varabyte/tap/kobweb

brew install --cask claude ghostty

curl -sL https://fonts.google.com/download?family=Inconsolata -o /tmp/Inconsolata.zip
unzip -o /tmp/Inconsolata.zip -d /tmp/Inconsolata
cp /tmp/Inconsolata/static/*.ttf ~/Library/Fonts/
rm -rf /tmp/Inconsolata /tmp/Inconsolata.zip

mkdir workspace
git clone git@github.com:altercation/solarized.git workspace/solarized
git clone git@github.com:jkaving/intellij-colors-solarized.git workspace/intellij-solarized


vim -c ":PlugInstall" -c ":q" -c ":q"

python3 ~/.vim/plugged/YouCompleteMe/install.py
