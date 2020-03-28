# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: ture|
|email|string|null: false, unique: true|
|password|string|null: false|
|password_confirmation|string|null: false|

### Association
- has_many :memos


## memosテーブル

|Column|Type|Options|
|------|----|-------|
|title|text|
|text|string|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
