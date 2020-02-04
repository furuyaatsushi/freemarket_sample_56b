# Freemarket_sample_56b
ご覧いただきありがとうございます。
<br>このアプリケーションはTECH::EXPERTの最終課題として作成しました、大手フリーマーケットサイト「メルカリ」のクローンサイトです。

url: http://3.115.217.15/
* Basic認証
<br>ID: 56b
<br>Password: 1005

# プレビュー
トップページ<br>
<img width="952" alt="スクリーンショット 2020-02-04 16.45.33.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/433361/8fbd0334-7f5b-a62f-9258-00fc4ffa16df.png">
商品出品画面<br>
<img width="952" alt="スクリーンショット 2020-02-04 16.44.52.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/433361/824e1df2-9561-45d1-f0a1-23693ceefcac.png">
商品検索画面<br>
<img width="1107" alt="スクリーンショット 2020-02-04 16.47.03.png" src="https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/433361/af4bb048-4fa1-1cb8-27ca-88ddd24b5f92.png">

# 開発メンバー
* 古谷篤志(SM)
* 石川友恵
* 栗本充
* 小池知佳
* 小山薫

# 制作環境
* Ruby on Rails '5.0.7.2'
* mysql2 '>= 0.3.18', '< 0.6.0'
* AWS、S3を用いたデプロイと画像の保存。


# 使い方
* トップページではピックアップカテゴリー、ブランドごとの商品が新しい順に並んでいます。
* ログインしていない状態でも検索したり商品の詳細をご覧になれますが、購入したり出品することはできません。
* メールアドレスによる登録方法を選ぶことができ、SMS認証とreCAPTCHAを用いて登録・ログインができます。(SNSによる登録は本番環境では行えません。)
* 登録が完了すると、商品を出品することができます。必須項目を入力すると出品できます。写真は6枚まで添付することができます。
* 出品した商品は、詳細画面より編集・削除ができます。
* 商品を購入する際は、クレジットカード情報(サンプルサイトなので仮番号)を入力することで購入処理が完了します。

# 工夫した点
* 技術と知識の未熟さから完全再現は難しかったが、持てる知識をうまく活用することで必要機能は再現できました。
* 夜間コースのチームで一緒に作業をしたり情報共有する時間が少なかったが、その中で効率的にコミュニケーションを取れたと思っています。

# 改善点
* JSを用いた動きや通信が少なく、全体的に寂しいWebサイトという印象が感じられると思いました。本家のように再現できなかった部分も多いので、課題終了後も手を加えていきたいと考えております。
* DB設計に関して、よく考えたつもりでも後から修正することが多く、様々な視点から情報を捉えることが重要だと感じました。

# 謝辞
この場をお借りしまして、担当ライフコーチの佐竹柚香さん、鶴岡篤人さん、5回にわたるスプリントレビューをしてくださった田中雅人さん、最後にこのような機会を設けていただいた、株式会社div代表取締役の真子社長をはじめとした社員の方々に深くお礼申し上げます。

# DB設計

## ER図
<img width="1194" alt="スクリーンショット 2019-12-21 1 06 21" src="https://user-images.githubusercontent.com/52952732/71268087-70eb8480-238f-11ea-9269-bbab386768f6.png">

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|profile|text||
|point|integer|null: false|

### Association

- has_many :items
- has_many :comments
- has_many :cards
- has_many :evaluations
- has_many :items, through: :likes
- has_one :personal
- accepts_nested_attributes_for :personal
- belongs_to :phone
- has_one :address
- accepts_nested_attributes_for :address

## personalテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday|date|null: false|
|postcode|string||
|prefecture_id|integer|foreign_key: true|
|city|string||
|address|string||
|building|string||

### Association

- belongs_to :user
- belongs_to :prefecture

## phoneテーブル
|Column|Type|Options|
|------|----|-------|
|phone_number|string|null: false|


### Association

- belongs_to :user

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_kana|string|null: false|
|first_name_kana|string|null: false|
|postcode|string|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|city|string|null: false|
|address|string|null: false|
|building|string||
|phone_number_sub|string||


### Association

- belongs_to :user
- belongs_to :prefecture

## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|status|string|null: false|
|size|string||
|shipping_charge|string|null: false|
|shipping_method|string|null: false|
|days_before_shipment|string|null: false|
|price|integer|null: false|
|saler_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|prefecture_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :saler, class_name: "User"
- belongs_to :buyer, class_name: "User"
- belongs_to :prefecture
- belongs_to :category
- has_many :comments
- has_many :photos
- belongs_to :brand
- has_many :users, through: :likes



## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|text||
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item



## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :users
- has_many :items
- has_many :personal
- has_many :address


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index?|

### Association

- has_many :items
- has_ancestry
- has_many :brands



## photosテーブル

|Column|Type|Options|
|------|----|-------|
|photo|text|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item



## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|category_id|integer|null: false, foreign_key|

### Association

- has_many :items



## cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association

- belongs_to :user



## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|evaluation|integer|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user



## likesテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :user