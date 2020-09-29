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

# テーブル設計

## usersテーブル

| Column              | Type   | Option                   |
| ------------------- | ------ | ------------------------ |
| first_name          | string | null: false, default: "" |
| first_name_kana     | string | null: false, default: "" |
| last_name           | string | null: false, default: "" |
| last_name_kana      | string | null: false, default: "" |
| email               | string | null: false, default: "" |
| password            | string | null: false, default: "" |
| nickname            | string | null: false, default: "" |
| birth_day           | date   | null: false              |

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

| Column                 | Type       | Option                                      |
| ---------------------- | ---------- | ------------------------------------------- |
| name                   | string     |              null: false                    |
| info                   | text       |              null: false                    |
| sales_status_id        | integer    | default: 0,  null: false                    |
| shipping_fee_status_id | integer    | default: 0,  null: false                    |
| prefecture_id          | integer    | default: 0,  null: false                    |
| scheduled_delivery_id  | integer    | default: 0,  null: false                    |
| category_id            | integer    | default: 0,  null: false                    |
| price                  | integer    | index: true, null: false                    |
| user                   | references |              null: false, foreign_key: true |

- belongs_to :user
- has_many :comments
- has_one :order
- has_one_attached :image

## ordersテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :address

## commentsテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

## addressesテーブル

| Column        | Type       | Option                                     |
| ------------- | ---------- | ------------------------------------------ |
| order         | references |             null: false, foreign_key: true |
| postal_code   | string     |             null: false                    |
| prefecture_id | integer    | default: 0, null: false                    |
| city          | string     |             null: false                    |
| addresses     | string     |             null: false                    |
| building_name | string     |                                            |
| phone_number  | string     |             null: false                    |

- belongs_to :order