source ~/workspace-setup/fanqiang.sh
vi -c "PlugUpdate | PlugUpgrade | qa"
bubu
brew reinstall neovim
upgrade_oh_my_zsh
antigen update
antigen selfupdate
pip install -U -r ~/workspace-setup/requirements.txt
go get -u github.com/nsf/gocode
go get -u github.com/alecthomas/gometalinter
go get -u github.com/golang/dep/cmd/dep
go get -u golang.org/x/tools/...
go get -u github.com/sourcegraph/go-langserver
npm update --force -g eslint eslint-plugin-vue npm wscat tern vue-language-server bash-language-server dockerfile-language-server-nodejs
# luarocks install --server=http://luarocks.org/dev lua-lsp
# luarocks install luacheck
