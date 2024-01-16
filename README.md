# README

## users テーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false, UNIQUE: true |
| email              | string  | null: false, UNIQUE: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column                 | Type        | Options                        |
|------------------------|-------------|--------------------------------|
| user                   | references  | null: false, foreign_key: true |
| item_name              | string      | null: false                    |
| description            | text        | null: false                    |
| category_id            | integer     | null: false                    |
| condition_id           | integer     | null: false                    |
| shopping_fee_burden_id | integer     | null: false                    |
| origin_region_id       | integer     | null: false                    |
| days_to_ship_id        | integer     | null: false                    |
| price                  | integer     | null: false                    |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user            | references | null: false, foreign_key: true |
| item            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## shopping_addresses テーブル

| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| postal_code    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| municipality   | string     | null: false                    |
| street_address | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |


### Association
- belongs_to :order
