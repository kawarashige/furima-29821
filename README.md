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

| Column              | Type   | Option      |
| ------------------- | ------ | ----------- |
| first_name          | string | null: false |
| first_name_kana     | string | null: false |
| last_name           | string | null: false |
| last_name_kana      | string | null: false |
| email               | string | null: false |
| password            | string | null: false |
| nickname            | string | null: false |
| birth_day           | date   | null: false |

- has_many :items
- has_many :comments
- has_many :purchases

## itemsテーブル

| Column                 | Type       | Option                         |
| ---------------------- | ---------- | ------------------------------ |
| name                   | string     | null: false                    |
| info                   | text       | null: false                    |
| sales_status_id        | integer    | null: false                    |
| shipping_fee_status_id | integer    | null: false                    |
| prefecture_id          | integer    | null: false                    |
| scheduled_delivery_id  | integer    | null: false                    |
| category_id            | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |

- belongs_to :user
- has_many :comments
- has_one :purchase

## purchaseテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item
- has_one :delivery

## commentsテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

- belongs_to :user
- belongs_to :item

## deliveryテーブル

| Column        | Type       | Option                          |
| ------------- | ---------- | ------------------------------- |
| purchase      | references | null: false, foreign_key: true  |
| postal_code   | string     | null: false                     |
| prefecture_id | integer    | null: false                     |
| city          | string     | null: false                     |
| address       | string     | null: false                     |
| building_name | string     |                                 |
| phone_number  | string     | null: false                     |

- belongs_to :purchase