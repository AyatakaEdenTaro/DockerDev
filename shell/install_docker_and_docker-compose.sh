#!/bin/bash
# 参考リンク
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04-ja
# https://www.trifields.jp/how-to-install-docker-on-ubuntu-2004-4436
# https://docs.docker.com/engine/install/ubuntu/

# Shell事前設定
# Docker Composeの最新バージョン
# 最新バージョンは以下のリンクから確認できます。
# https://github.com/docker/compose/releases
# バージョン番号を変更します。
# URLの参考リンクは以下になります。
# https://qiita.com/moritalous/items/93cfbabe7061f2918276
DOCKER_COMPOSE_VERSION=$1

# 古いバージョンをアンインストールします。
sudo apt-get remove docker docker-engine docker.io containerd runc
# 既存のパッケージのリストを更新します。
sudo apt update
# パッケージインデックスを更新し、aptパッケージをインストールしaptて、HTTPS経由でリポジトリを使用できるようにします。
sudo apt-get install -y ca-certificates curl gnupg lsb-release
# Dockerの公式GPGキーを追加します。
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Dockerの安定板のリポジトリを追加します。
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# 次に、追加されたリポジトリからDockerパッケージでパッケージデータベースを更新します。
sudo apt update
# Dockerをインストールします。
sudo apt-get install -y docker-ce docker-ce-cli containerd.io
# Docker Composeをダウンロードします。
sudo curl -L "https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
# ダウンロードしたファイルに実行権限を付与します。
sudo chmod +x /usr/local/bin/docker-compose