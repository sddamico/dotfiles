cd ~

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget zsh git brew-cask curl ffmpeg gcc go gradle \
  groovy leiningen libpng node openssl ruby python redis sqlite vim \
  the_silver_searcher sloccount pidcat android ctags

mkdir workspace
git clone git@github.com:altercation/solarized.git workspace/solarized
git clone git@github.com:jkaving/intellij-colors-solarized.git workspace/intellij-solarized
