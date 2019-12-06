# README

## WEBサービス名
 
PICPOS　
　画像投稿サービス（簡易版）

## 概要
 
- URL: http://3.114.3.46/

 
## 使用した技術と機能一覧
 
- フロント
  - haml/Sass/JavaSqript/jQuery

- サーバーサイド
  - 写真とテキストの投稿・編集・削除
  - 投稿に対するコメント機能
  - 投稿機能の単体テスト(Rspec)

- インフラ
  - EC2（AWS)
  - Mysql
  - S3（AWS）

# picpos DB設計

## postsテーブル
|Column|Type|Options|
|------|----|-------|
|picture|string|null: false|
|text|string|limit:254,null: false|
### Association
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|limit:254,null: false|
|post_id|references|null: false, foreign_key: true|
### Association
- belongs_to :post
