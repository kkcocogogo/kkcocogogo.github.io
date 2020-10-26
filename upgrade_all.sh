source ~/workspace-setup/fanqiang.sh
helm repo update
vi -c "PlugUpdate | PlugUpgrade | qa"
brew update && brew upgrade && brew cleanup -s
brew reinstall neovim
omz update
antigen update
antigen selfupdate
pip install -U -r ~/workspace-setup/requirements.txt
# go get -u github.com/nsf/gocode
# go get -u github.com/sourcegraph/go-langserver
# npm update --force -g bash-language-server
# npm update --force -g eslint eslint-plugin-vue npm wscat tern vue-language-server
# luarocks install --server=http://luarocks.org/dev lua-lsp
# luarocks install luacheck
