# テーブル設計

## users テーブル
|Column   |Type    |Options     |
|---------|--------|------------|
|nickname |string  |null: false |
|email    |string  |null: false |
|password |string  |null: false |
|name     |string  |null: false |
|birthday |integer |null: false |

### Association
- has_many :goods
- has_many :comments

## goods テーブル
|Column   |Type    |Options      |
|---------|--------|------------ |
|name     |string  |null: false  |
|comment  |text    |null: false  |
|category |string  |null: false  |
|status   |string  |null: false  |
|burden   |string  |null: false  |
|area     |string  |null: false  |
|date     |string  |null: false  |
|price    |integer |null: false  |
|bought   |boolean |default: false|

### Association
- belongs_to :users
- has_many   :comments, dependent: :destroy
- has_one_attached :image

## comments テーブル
|Column  |Type |Options     |
|--------|-----|------------|
|comment |text |null: false |

### Association
- belongs_to :users
- belongs_to :goods

## active_storage　テーブル 
Active　Storageを使用して作成
