source ~/workspace-setup/fanqiang.sh
vi -c "PlugUpdate | PlugUpgrade | qa"
bubu
upgrade_oh_my_zsh
antigen update
antigen selfupdate
pip install -U -r ~/workspace-setup/requirements.txt
go get -u github.com/nsf/gocode
go get -u honnef.co/go/tools/cmd/megacheck
go get -u github.com/golangci/golangci-lint/cmd/golangci-lint
go get -u github.com/golang/dep/cmd/dep
go get -u golang.org/x/tools/...
go get -u github.com/sourcegraph/go-langserver
cnpm update -g eslint eslint-plugin-vue npm wscat tern vue-language-server bash-language-server
