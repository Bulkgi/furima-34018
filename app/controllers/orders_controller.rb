class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    
  end

  def create
    binding.pry
  end

  private
  def order_params
    params.require(:postal_code, :area_id, :municipality, :address , :building , :phone, :order_id).merge( item_id: item.id)
  end
end
