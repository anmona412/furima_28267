# テーブル設計

## users テーブル
|Column   |Type    |Options     |
|---------|--------|------------|
|nickname |string  |null: false |
|email    |string  |null: false |
|password |string  |null: false |
|user_name|string  |null: false |
|birthday |integer |null: false |

### Association
- has_many :goods
- has_many :bought_by
- has_many :comments
--------------------------------------------------

## goods テーブル
|Column    |Type    |Options      |
|--------- |--------|------------ |
|user_id   |integer |null: false  |
|goods_name|string  |null: false  |
|comment   |text    |null: false  |
|category  |string  |null: false  |
|status    |string  |null: false  |
|burden    |string  |null: false  |
|send_from |string  |null: false  |
|send_at   |string  |null: false  |
|price     |integer |null: false  |


### Association
- belongs_to :users
- has_many   :comments, dependent: :destroy
- has_one :bought_by
- has_one_attached :image
--------------------------------------------------

## bought_by テーブル
|Column  |Type    |Options     |
|--------|-----   |------------|
|user_id |integer |null: false |
|goods_id|integer |null: false |


### Association
- belongs_to :users
- belongs_to :goods
- has_one :send_to
--------------------------------------------------

## send_to テーブル
|Column      |Type    |Options     |
|--------    |-----   |------------|
|bought_by_id|integer |null: false |
|postal_code |integer |null: false |
|prefectures |string  |null: false |
|city        |string  |null: false |
|address     |string  |null: false |
|building    |string  |null: false |
|phone_number|integer |null: false |


### Association
- belongs_to :bought_by
--------------------------------------------------

## comments テーブル
|Column  |Type    |Options     |
|--------|-----   |------------|
|user_id |integer |null: false |
|goods_id|integer |null: false |
|comment |text    |null: false |

### Association
- belongs_to :users
- belongs_to :goods
--------------------------------------------------


## active_storage テーブル 
Active Storageを使用して作成
