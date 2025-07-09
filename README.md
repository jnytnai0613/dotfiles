### ファイル更新後、GitHubへのUpload
```zsh
# task dg -- タイトル
$ tg -- タイトル
```

#### 新環境で実行
```zsh
# Homebrewインストール
# インストール結果にPATHを通すコマンドが出力されるので、これも実行
# https://brew.sh/
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# 各種ソフトウエアインストール
$ . ./setup.zsh

# ファイル配置
$ . ./link.zsh

# aquaにてパッケージインストール
$ aqgi

# krew初期設定
$ krew install krew
$ k krew list

# kubectlプラグインインストール
$ krewfile -file ~/.config/krew/krewfile

# ghqのルート設定
$ git config --global ghq.root '~/src'
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