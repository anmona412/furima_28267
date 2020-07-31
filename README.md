# テーブル設計

## users テーブル
|Column           |Type    |Options     |
|-----------------|--------|------------|
|nickname         |string  |null: false |
|email            |string  |null: false |
|password         |string  |null: false |
|family_name_zen  |string  |null: false |
|given_name_zen   |string  |null: false |
|family_name_kana |string  |null: false |
|given_name_kana  |string  |null: false |
|birthday         |date    |null: false |

### Association
- has_many :items
- has_many :bought_by
- has_many :comments
--------------------------------------------------

## items テーブル
|Column       |Type    |Options      |
|---------    |--------|------------ |
|user_id      |integer |null: false  |
|name         |string  |null: false  |
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
- has_many   :send_to
- has_one    :bought_by
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
|item_id |integer |null: false |


### Association
- belongs_to :users
- belongs_to :items
- has_one :send_to
--------------------------------------------------

## send_to テーブル
|Column         |Type    |Options     |
|--------       |-----   |------------|
|items_id       |integer |null: false |
|postal_code    |string  |null: false |
|prefectures_id |integer |null: false |
|city           |string  |null: false |
|address        |string  |null: false |
|building       |string  |null: false |
|phone_number   |string  |null: false |


### Association
- belongs_to :items
- belongs_to_active_hash :prefectures
--------------------------------------------------

## comments テーブル
|Column  |Type    |Options     |
|--------|-----   |------------|
|user_id |integer |null: false |
|items_id|integer |null: false |
|comment |text    |null: false |

### Association
- belongs_to :users
- belongs_to :items
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
