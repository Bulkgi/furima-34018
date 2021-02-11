class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product,                 null: false      
      t.text :description,               null: false    
      t.string :category_id,             null: false   
      t.string :state_id,                null: false     
      t.string :delivery_fee_burden_id,  null: false 
      t.string :area_id,                 null: false    
      t.string :day_id,                  null: false     
      t.string :price,                   null: false    
      t.references :user,                null: false, foreign_key: true 
      t.timestamps
    end
  end
end
