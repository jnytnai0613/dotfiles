### ファイル更新後、GitHubへのUpload
```zsh
# task dg
$ tg
```

#### 新環境で実行
```zsh
# 各種ソフトウエアインストール
$ . ./setup.zsh
# ファイル配置
$ . ./install.zsh
```

#### 各種エイリアス
```zsh
# aqua
$ alias aq='aqua'
$ alias aqcd='cd ${XDG_CONFIG_HOME:-$HOME/.config}/aqua/'
$ alias aqgi='aqua generate -i -o $AQUA_GLOBAL_CONFIG'
$ alias aqia='aqua install --all -c $AQUA_GLOBAL_CONFIG'
$ alias aqli='aqua list --installed --all | sort'
$ alias aqup='aqua update -c $AQUA_GLOBAL_CONFIG'

# Kubernetes
$ alias k='kubecolor'

# Task
$ alias tg='task dg -t ~/src/github.com/jnytnai0613/dotfiles/Taskfile.dist.yml'
$ alias tl='task ls -t ~/src/github.com/jnytnai0613/dotfiles/Taskfile.dist.yml'
$ alias tb='task bd -t ~/src/github.com/jnytnai0613/dotfiles/Taskfile.dist.yml'
```