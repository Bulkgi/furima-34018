class OrdersController < ApplicationController
 before_action :authenticate_user!, only: [:index,:create]
 before_action :set_item, only: [:index, :create]
 before_action :present, only: [:index, :create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)
    if @order_address.valid?
      pay_item
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

  def present
    if @item.order.present? || @item.user.id == current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: address_params[:token],    
        currency: 'jpy'                 
      )
  end

end
