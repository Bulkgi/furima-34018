class Item < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :delivery_fee_burden
  belongs_to :area
  belongs_to :day
  has_one_attached :image


  with_options presence: true do
    validates :product
    validates :description
    validates :price
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id 
    validates :state_id
    validates :delivery_fee_burden_id 
    validates :area_id 
    validates :day_id
  end

end
