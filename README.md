## usersテーブル

  |Column      |Type Option | Options     |
  |----------- |------------|-------------|
  |email       | string     | null: false |
  |password    | string     | null: false |
  |nickname    | string     | null: false |
  |first_name  | string     | null: false |
  |last_name   | string     | null: false |
  |birthday    | date       | null: false |


### Association
 -  has_many :items
 -  has_many :buyers



## itemsテーブル

  | Column              | Type Option | Options     |
  |-------------------- | ----------- | ----------- |
  | product             | string      | null: false |
  | description         | text        | null: false |
  | category            | string      | null: false |
  | state               | string      | null: false |
  | delivery_fee_burden | string      | null: false |
  | area                | string      | null: false |
  | days                | date        | null: false |
  | user_id             | references  |             |

### Association 
 - belongs_to :users
 - has_one :buyers


## buyersテーブル

 | Column     | Type Option | Options     |
 | ---------- | ----------- | ----------- |
 | user_id    | references  |             |
 | item_id    | references  |             |

### Association
 - belongs_to :items
 - has_one :addresses


### addressesテーブル

 | Column       | Type Option | Options     |
 | ------------ | ----------- | ----------- |
 | postal_code  | numeric     | null: false |
 | prefecture   | string      | null: false |
 | municipality | string      | null: false |
 | address      | string      | null: false |
 | building     | string      |             |

### Association
 - belongs_to :buyers
