### ファイル更新後、GitHubへのUpload
```zsh
$ task dg
```

#### 新環境へファイル配置
```zsh
$ . ./setup.zsh
$ . ./install.zsh
```

#### 各種エイリアス
```zsh
$ alias aq='aqua'
$ alias aqcd='cd ${XDG_CONFIG_HOME:-$HOME/.config}/aqua/'
$ alias aqgi='aqua generate -i -o $AQUA_GLOBAL_CONFIG'
$ alias aqia='aqua install --all -c $AQUA_GLOBAL_CONFIG'
$ alias aqli='aqua list --installed --all | sort'
$ alias aqup='aqua update -c $AQUA_GLOBAL_CONFIG'

$ alias k='kubecolor'
```