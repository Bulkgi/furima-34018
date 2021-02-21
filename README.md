## usersテーブル

  |Column             |Type Option | Options                  |
  |------------------ |------------|------------------------- |
  |email              | string     | null: false unique: true |
  |encrypted_password | string     | null: false              |
  |nickname           | string     | null: false              |
  |first_name         | string     | null: false              |
  |last_name          | string     | null: false              |
  |first_name_ruby    | string     | null: false              |
  |last_name_ruby     | string     | null: false              |
  |birthday           | date       | null: false              |


### Association
 -  has_many :items
 -  has_many :orders



## itemsテーブル

  | Column                 | Type Option | Options                        |
  |----------------------- | ----------- | ------------------------------ |
  | product                | string      | null: false                    |
  | description            | text        | null: false                    |
  | category_id            | integer     | null: false                    |
  | state_id               | integer     | null: false                    |
  | delivery_fee_burden_id | integer     | null: false                    |
  | area_id                | integer     | null: false                    |
  | day_id                 | integer     | null: false                    |
  | price                  | integer     | null: false                    |
  | user                   | references  | null: false, foreign_key: true |
  

### Association 
 - belongs_to :user
 - has_one :order


## ordersテーブル

 | Column     | Type Option | Options                        |
 | ---------- | ----------- | ------------------------------ |
 | user       | references  | null: false, foreign_key: true |
 | item       | references  | null: false, foreign_key: true |

### Association
 - belongs_to :item
 - has_one :address
 - belongs_to :user


### addressesテーブル

 | Column        | Type Option | Options                        |
 | ------------- | ----------- | ------------------------------ |
 | postal_code   | string      | null: false                    |
 | area_id       | integer     | null: false                    |
 | municipality  | string      | null: false                    |
 | address       | string      | null: false                    |
 | building      | string      |                                |
 | phone         | string      | null: false                    |
 | order         | references  | null: false, foreign_key: true |

### Association
 - belongs_to :order
