# アプリケーション名
Roadbike Group Ride
# アプリケーション概要
ロードバイクで、共通した目的の仲間をイベント投稿で集い、様々な方と交流することができる。
# URL
http://54.92.53.229/
# テスト用アカウント
・Basic認証ID：admin<br>
・Basic認証パスワード：2222<br>
・メールアドレス：hoge@hoge.com<br>
・パスワード：hoge1111
# 利用方法
## イベント投稿
1.ヘッダーから、ユーザー新規登録を行う。<br>
2.ヘッダーから、「投稿する」ボタンを押す。<br>
3.新規イベント投稿画面に必須項目を入力し、投稿する。
## エントリー
1.一覧ページから、エントリーしたいイベントをクリックし、イベント詳細ページに移る。<br>
2.「エントリーする」を押す。
# アプリケーションを作成した背景
ロードバイクで、共通の目的を持った仲間を探すのは難しいと感じて、ソロばかりで走っている人の課題を解決するため、様々な人と交流もできるイベント投稿＆コミュニケーション促進アプリを作成することにした。
# 洗い出した要件
[要件定義書](https://docs.google.com/spreadsheets/d/1Mu4cBakDLOXHAyDNGOb5jlJaxfQvG7XmzzJknaKLceA/edit?usp=sharing)
# 実装した機能についての画像やGIFおよびその説明
## お気に入り機能
[![Image from Gyazo](https://i.gyazo.com/5681aac4348c42738bd11d1fa119d47d.gif)](https://gyazo.com/5681aac4348c42738bd11d1fa119d47d)<br>
イベント一覧内の☆をクリックすると、非同期通信によって★に変更され、お気に入り登録することができる。もう一度クリックすると、☆に戻り、お気に入り解除することができる。
# 実装予定の機能
タグ機能、走行ルート表示機能を実装予定。
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/8dff723d8759ed55b1a7b2942feb2242.png)](https://gyazo.com/8dff723d8759ed55b1a7b2942feb2242)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/d7265f5a76a2c4c5e54865d47b976bd9.png)](https://gyazo.com/d7265f5a76a2c4c5e54865d47b976bd9)
# 開発環境
・フロントエンド<br>
Bootstrap<br>
Javascript

・バックエンド<br>
Ruby on Rails

・インフラ<br>
AWS EC2<br>
AWS S3

・テスト<br>
RSpec

・テキストエディタ<br>
Visual Studio Code

・タスク管理<br>
GitHub Issues
# ローカルでの動作方法
以下のコマンドを順に実行。<br>
% git clone https://github.com/Kazuho1222/roadbike_groupride.git<br>
% cd roadbike_groupride<br>
% bundle install<br>
% yarn install
# 工夫したポイント
bootstrapを使用することで、フロントエンドにかかる作業時間を減らしつつ、見た目も意識した作りに仕上げところ。