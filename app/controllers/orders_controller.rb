class OrdersController < ApplicationController
 before_action :authenticate_user!, only: [:index,:create]

  def index
    @item = Item.find(params[:item_id])
    if @item.order.present? || @item.user.id == current_user.id
      redirect_to root_path
    else
      @order_address = OrderAddress.new
    end
  end

  def create
    @order_address = OrderAddress.new(address_params)
    @item = Item.find(params[:item_id])
    if @order_address.valid?
      Payjp.api_key = "sk_test_4172ecbdd27e47a80928e60a"
      Payjp::Charge.create(
        amount: @item.price,
        card: address_params[:token],    
        currency: 'jpy'                 
      )
      @order_address.save
      redirect_to root_path
    else
      
      render :index
    end
  end

  private
  def address_params
    params.require(:order_address).permit(:postal_code, :area_id, :municipality, :address , :building , :phone, :order_id).merge(item_id: params[:item_id], user_id: current_user.id,token: params[:token])
  end

  
end
