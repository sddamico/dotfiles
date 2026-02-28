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

# Claude Code: register marketplaces and install plugins
claude plugin marketplace add https://github.com/anthropics/claude-plugins-official
claude plugin marketplace add https://github.com/777genius/claude-notifications-go
claude plugin marketplace add https://github.com/ChromeDevTools/chrome-devtools-mcp
claude plugin marketplace add ~/.claude/plugins/local

claude plugin install frontend-design@claude-plugins-official
claude plugin install context7@claude-plugins-official
claude plugin install feature-dev@claude-plugins-official
claude plugin install code-simplifier@claude-plugins-official
claude plugin install commit-commands@claude-plugins-official
claude plugin install security-guidance@claude-plugins-official
claude plugin install kotlin-lsp@claude-plugins-official
claude plugin install claude-md-management@claude-plugins-official
claude plugin install skill-creator@claude-plugins-official
claude plugin install claude-notifications-go@claude-notifications-go
claude plugin install chrome-devtools-mcp@chrome-devtools-plugins
claude plugin install todo@local
