# README

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
