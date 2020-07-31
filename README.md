# テーブル設計

## users テーブル
|Column   |Type    |Options     |
|---------|--------|------------|
|nickname |string  |null: false |
|email    |string  |null: false |
|password |string  |null: false |
|name     |string  |null: false |
|birthday |date    |null: false |

### Association
- has_many :goods
- has_many :bought_by
- has_many :comments
--------------------------------------------------

## goods テーブル
|Column       |Type    |Options      |
|---------    |--------|------------ |
|user_id      |integer |null: false  |
|goods_name   |string  |null: false  |
|comment      |text    |null: false  |
|category_id  |integer |null: false  |
|price        |integer |null: false  |
|status_id    |integer |null: false  |
|burden_id    |integer |null: false  |
|send_from_id |integer |null: false  |
|send_at_id   |integer |null: false  |

### Association
- belongs_to :users
- has_many   :comments, dependent: :destroy
- has_one :bought_by
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :burden
- belongs_to_active_hash :send_from
- belongs_to_active_hash :send_at
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
|Column         |Type    |Options     |
|--------       |-----   |------------|
|bought_by_id   |integer |null: false |
|postal_code    |integer |null: false |
|prefectures_id |integer |null: false |
|city           |string  |null: false |
|address        |string  |null: false |
|building       |string  |null: false |
|phone_number   |integer |null: false |


### Association
- belongs_to :bought_by
- belongs_to_active_hash :prefectures
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

### ActiveHash使用
|Model       |
|------------|
|category    |
|status      |
|burden      |
|send_from   |
|send_at     |
|prefectures |

-------------------------------------------------
## active_storage テーブル 
Active Storageを使用して作成
