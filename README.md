# LifeHackSharing
日常の生産性を高めるノウハウやちょっとした工夫、裏技などの生活に役立つライフハック術を投稿、共有するアプリケーション

## Features
  - HTML/SASS記法と、命名規則BEMを使ったマークアップ
  - capistranoによるAWS EC2への自動デプロイ
  - ActiveStorageを使用しAWS S3への画像アップロード

## Function
  - ユーザー管理機能(ユーザー登録/ログイン/ログアウト)
  - 投稿機能/編集機能
  - 投稿一覧閲覧機能
  - 投稿詳細機能
  - キーワード検索機能/カテゴリー別検索機能
  - コメント機能
  - 非同期通信機能
  - ユーザーマイページ(投稿一覧/いいね一覧)
  - ページネーション機能
  - 画像アップロード機能
  - いいね機能

## Application Technology
|種別|名称|
|------|----|
|開発言語|Ruby(ver.2.5.1)|
|マークアップ|HTML|
|フロントエンド|JavaScript(jquery)|
|DB|MySQL|
|本番環境|AWS EC2|
|Webサーバー|Nginx|
|Applicationサーバー|Unicorn|
|画像アップロード|carrierwave|
|自動デプロイ|capistrano|
|ユーザー管理|devise|

# DataBase

## Entity Relationship Diagram
<img width="627" alt="スクリーンショット 2019-11-25 22 01 23" src="https://user-images.githubusercontent.com/55783692/69542659-45af8880-0fcf-11ea-822f-2d9a4f0a1fba.png">

### users table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email|string|null: false, unique: true|

#### association
  - has_many :articles, dependent: :destroy
  - has_many :comments, dependent: :destroy
  - has_many :likes, dependent: :destroy

### articles table
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|image|string|null: false|
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|

#### association
  - belongs_to :user
  - belongs_to :category
  - has_many :comments, dependent: :destroy
  - has_many :likes, dependent: :destroy

### comments table
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|article_id|references|foreign_key: true|
|text|text|null: false|

#### association
  - belongs_to :user
  - belongs_to :article

### categories table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

#### association
  - has_many :articles

### likes table
|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|article_id|references|foreign_key: true|

#### association
  - belongs_to :user
  - belongs_to :article