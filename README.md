# Freighter 
  
意味は貨物船。
ドッカーコンテナを動かす為に必要な設定やツールが搭載されたOSコンテナ。
  
## やりたいこと

centOSのイメージ作成
主にアルカスなどでの運用を想定している。  
その為、GIT,DOCKERは標準搭載。さらにSSH接続が出来るようにしておく。
ボリュームのマウントが出来ない為、データバックアップ機能として、rsyncを採用する。
他にいい案があれば、考慮する。。。
バックアップはgitでデータファイルを世代管理してもいいかも。。。


を標準装備したOSイメージを作成する。
→のちのちログ監視とかも考えたい。


## 盛り込む機能

- ユーザ指定
- ユーザパスワード指定
- ssh接続可能
- rsync
- rsyncのクーロン実行
- 権限付与


## 課題
- 設定はどうやって反映するか
- 環境変数をどうやって読み込ませるか・・・など
- データのバックアップ先候補はグーグルドライブ？
- 実際にバックアップ出来るかやってみねば・・・

