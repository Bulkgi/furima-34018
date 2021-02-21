class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :area_id, :municipality, :address , :building , :phone, :user_id, :item_id
  attr_accessor :token

  # ここにバリデーションの処理を書く
  with_options presence:true do

    validates :postal_code, format:{ with: /\A\d{3}[-]\d{4}\z/ }
    validates :phone, format:{ with: /\A[0-9]{,11}\z/}
    

    with_options numericality: { other_than: 1 } do
      validates :area_id
    end

      validates :municipality 
      validates :address   
      validates :user_id
      validates :item_id
      validates :token
       
  end
    

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, address: address, building: building, phone: phone, order_id: order.id)
  end
end