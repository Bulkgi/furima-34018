class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new(order_params)
  end

  private
  def order_params
    params.require(:postal_code, :area_id, :municipality, :address , :building , :phone).merge(user_id: current_user.id, item_id: item.id)
  end
end
