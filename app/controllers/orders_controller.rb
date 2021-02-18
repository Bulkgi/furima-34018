class OrdersController < ApplicationController

  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @order_address = OrderAddress.new(address_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      
      render :index
    end
  end

  private
  def address_params
    params.permit(:postal_code, :area_id, :municipality, :address , :building , :phone, :order_id).merge(item_id: params[:item_id], user_id: current_user.id)
  end

  
end
