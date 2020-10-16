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

# テーブル設計f

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

# テーブル設計

## users_allテーブル

| Column      | Type    | Option                   |
| ----------- | ------- | ------------------------ |
| nickname    | string  | null: false, default: "" |
| email       | string  | null: false, default: "" |
| password    | string  | null: false, default: "" |
| years_older | integer | null: false              |
| experience  | integer | null: false              |

### Association

- has_one :home
- has_one :study
- has_many :items
- has_many :recycles
- has_many :room_all_users_all
- has_many :rooms_all, through: room_all_users_all
- has_many :messages_all
- has_many :user_a_users_all
- has_many :users_a, through: user_a_users_all
- has_many :user_b_users_all
- has_many :users_b, through: user_b_users_all
- has_many :user_c_users_all
- has_many :users_c, through: user_c_users_all

## user_a_users_allテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user_all | references | null: false, foreign_key: true |
| user_a   | references | null: false, foreign_key: true |

### Association

- belongs_to :user_all
- belongs_to :user_a

## user_b_users_allテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user_all | references | null: false, foreign_key: true |
| user_b   | references | null: false, foreign_key: true |

### Association

- belongs_to :user_all
- belongs_to :user_b

## user_c_users_allテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user_all | references | null: false, foreign_key: true |
| user_c   | references | null: false, foreign_key: true |

### Association

- belongs_to :user_all
- belongs_to :user_c

## user_aテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
|        |      |        |

### Association

- has_many :room_a_users_a
- has_many :rooms_a, through :room_a_users_a
- has_many :messages_a

## user_bテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
|        |      |        |

### Association

- has_many :room_b_users_b
- has_many :rooms_b, through :room_b_users_b
- has_many :messages_b

## user_cテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
|        |      |        |

### Association

- has_many :room_c_users_c
- has_many :rooms_c, through :room_c_users_c
- has_many :messages_c

## message_allテーブル

| Column      | Type       | Option                         |
| ----------- | ---------- | ------------------------------ |
| content_all | text       | null: false, default: ""       |
| user_all    | references | null: false, foreign_key: true |
| room_all    | references | null: false, foreign_key: true |

### Association

- belongs_to :room_all
- belongs_to :user_all

## message_aテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| content_a | text       | null: false, default: ""       |
| user_a    | references | null: false, foreign_key: true |
| room_a    | references | null: false, foreign_key: true |

### Association

- belongs_to :room_a
- belongs_to :user_a

## message_bテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| content_b | text       | null: false, default: ""       |
| user_a    | references |              foreign_key: true |
| user_b    | references | null: false, foreign_key: true |
| room_b    | references | null: false, foreign_key: true |

### Association

- belongs_to :room_b
- belongs_to :user_a
- belongs_to :user_b

## message_cテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| content_c | text       | null: false, default: ""       |
| user_a    | references |              foreign_key: true |
| user_b    | references |              foreign_key: true |
| user_c    | references | null: false, foreign_key: true |
| room_c    | references | null: false, foreign_key: true |

### Association

- belongs_to :room_c
- belongs_to :user_a
- belongs_to :user_b
- belongs_to :user_c

## room_all_users_allテーブル

| Column | Type | Option |
| ------ | ---- | ------ |
| user_all | references | null: false, foreign_key: true |
| room_all | references | null: false, foreign_key: true |

### Association
- belongs_to :user_all
- belongs_to :room_all

## room_a_users_aテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user_a | references | null: false, foreign_key: true |
| room_a | references | null: false, foreign_key: true |

### Association
- belongs_to :user_a
- belongs_to :room_a

## room_b_users_bテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user_b | references | null: false, foreign_key: true |
| room_b | references | null: false, foreign_key: true |

### Association
- belongs_to :user_b
- belongs_to :room_b

## room_c_users_cテーブル

| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user_c | references | null: false, foreign_key: true |
| room_c | references | null: false, foreign_key: true |

### Association
- belongs_to :user_c
- belongs_to :room_c

## room_allテーブル

| Column   | Type   | Option                   |
| -------- | ------ | ------------------------ |
| name_all | string | null: false, default: "" |

### Association
- has_many :room_all_users_all
- has_many :users, through :room_all_users_all
- has_many :messages_all

## room_aテーブル

| Column | Type   | Option                   |
| ------ | ------ | ------------------------ |
| name_a | string | null: false, default: "" |

### Association
- has_many :room_a_users_a
- has_many :users, through :room_a_users_a
- has_many :messages_a

## room_bテーブル

| Column | Type   | Option                   |
| ------ | ------ | ------------------------ |
| name_b | string | null: false, default: "" |

### Association
- has_many :room_b_users_b
- has_many :users, through :room_b_users_b
- has_many :messages_b

## room_cテーブル

| Column | Type   | Option                   |
| ------ | ------ | ------------------------ |
| name_c | string | null: false, default: "" |

### Association
- has_many :room_c_users_c
- has_many :users, through :room_c_users_c
- has_many :messages_c

## homesテーブル

| Column    | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| history   | text       |              default: ""       |
| celebrity | text       |              default: ""       |
| info      | text       |              default: ""       |
| user_all  | references | null: false, foreign_key: true |

### Association
- belomgs_to :user_all

## studiesテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user_all | references | null: false, foreign_key: true |

### Association
- belongs_to :user_all

## itemsテーブル 

| Column         | Type       | Option                         |
| -------------- | ---------- | ------------------------------ |
| old            | integer    | null: false                    |
| item_info      | string     | null: false, default: ""       |
| item_status_id | integer    | null: false, default: 0        |
| prefecture_id  | integer    | null: false, default: 0        |
| schedule_id    | integer    | null: false, default: 0        |
| user_all       | references | null: false, foreign_key: true |


### Association
- belongs_to :user_all
- has_one :recycle

## recyclesテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user_all | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association
- belongs_to :user_all
- belongs_to :item
- has_one :address

## addressesテーブル

| Column   | Type       | Option                              |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false, default: ""       |
| prefecture_id | integer    | null: false, default: 0        |
| city          | string     | null: false, default: ""       |
| addresses     | string     | null: false, default: ""       |
| building      | string     | null: false, default: ""       |
| phone         | string     | null: false, default: ""       |
| recycle       | references | null: false, foreign_key: true |

### Association
- belongs_to :recycle

# データベース設計