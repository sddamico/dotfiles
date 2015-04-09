cd ~

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install caskroom/cask/brew-cask wget zsh git curl ffmpeg gcc go gradle \
  groovy leiningen libpng node openssl ruby python redis sqlite vim \
  the_silver_searcher sloccount pidcat android ctags gist jq \
  cmake imagemagick 

brew install llvm --with-clang

mkdir workspace
git clone git@github.com:altercation/solarized.git workspace/solarized
git clone git@github.com:jkaving/intellij-colors-solarized.git workspace/intellij-solarized


vim -c ":PlugInstall" -c ":q" -c ":q"

cd ~/.vim/plugged/YouCompleteMe/
./install.sh
cd ~
