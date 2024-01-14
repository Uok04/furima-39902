# README

## users テーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false, UNIQUE: true |
| email              | string  | null: false               |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birth_year         | integer | null: false               |
| birth_month        | integer | null: false               |
| birth_day          | integer | null: false               |

### Association
- has_many :items
- belongs_to :users

## items テーブル

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| user                | references | null: false, foreign_key: true |
| item_name           | string     | null: false                    |
| description         | text       | null: false                    |
| category            | string     | null: false                    |
| condition           | string     | null: false                    |
| shopping_fee_burden | integer    | null: false                    |
| origin_region       | string     | null: false                    |
| days_to_ship        | integer    | null: false                    |
| price               | integer    | null: false                    |

### Association
- belongs_to :users
- has_one :orders

## orders テーブル

| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| user            | references | null: false, foreign_key: true |
| card_number     | integer    | null: false                    |
| expiration_date | integer    | null: false                    |
| security_code   | integer    | null: false                    |

### Association
- belongs_to :users
- belongs_to :items
- belongs_to :shopping_addresses

## shopping_addresses テーブル

| Column         | Type    | Options     |
|----------------|---------|-------------|
| postal_code    | integer | null: false |
| prefecture     | string  | null: false |
| municipality   | string  | null: false |
| street_address | string  | null: false |
| building_name  | string  | null: false |
| phone_number   | integer | null: false |

### Association
- has_one :shopping_addresses
