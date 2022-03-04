# 概要
このライブラリは、vagrant及びdockerを使用して、PostgreSQL構築に成功したライブラリである。環境はwindows10。

# 構築手順

## 1.vagrantのインストール
以下のリンクからダウンロードできます。   
https://www.vagrantup.com/downloads  
以下のコマンドでインストール確認ができます。  
```
vagrant -v
```

## 2.virtualBoxのインストール
以下のリンクからダウンロードできます。  
https://www.virtualbox.org/wiki/Downloads  
インストール後はVirtualBoxのアイコンが表示されます。

## 3.Vagrantfileの確認
本来であれば以下のコマンドで作成しますが、既に作成しています。
```
vagrant init generic/ubuntu2004
```
ファイルは以下の意味になります。
### config.vm.box
インストールするBoxファイルです。BoxファイルによってOSが決まります。  
今回は"generic/ubuntu2004"を設定しています。  
Boxファイルは以下のリンクから検索できます。  
https://app.vagrantup.com/boxes/search
### config.vm.network
ネットワークの設定です。  
今回はブリッジアダプターを使用したいので、"public_network"を設定しています。  
詳細は以下を確認した方が速いです。  
https://qiita.com/centipede/items/64e8f7360d2086f4764f
### config.vm.synced_folder
共有フォルダーの設定です。  
今回はwindowsのshareフォルダを/shareに紐づけています。  
### vb.name
仮想マシン名です。設定すると、VirtualBoxの表示名が変わります。  
設定しなくても支障はありません。

## 4.仮想マシンの起動
Vagrantfileと同じ階層にカレントがある状態で以下のコマンドを実行します。
```
vagrant up
```

## 5.仮想マシンに接続
以下のコマンドで接続できます。
```
vagrant ssh
```

## 6.DockerとDocker Composeをインストールする
install_docker_and_docker-compose.shにコマンドまとめているので、この中のコマンドを順番に実行します。

## 7.Dockerコンテナを立ち上げる
/share/postgresql配下にdocker-compose.ymlがあるので、cd後に立ち上げのコマンドを実行する。
```
cd /share/postgresql
docker-compose up -d
```

## 8.ipアドレスを確認する
以下のコマンドで確認できる。表示される一覧の内、eth1がブリッジネットワークの情報なので、そっちのipアドレスを使用する。
```
ip a
```

## 9.接続確認をする
pgadminは以下のURLでアクセスできる。  
http://8で確認したipアドレス:81  
postgresqlは以下の情報でアクセスできる。
### ホスト名
8で確認したipアドレス
### ポート番号
5432
### ユーザー名
test
### パスワード
password
### DB名
sample
