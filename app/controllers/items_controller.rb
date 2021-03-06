class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create, :edit, :update]
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :present, only:[:edit, :update, :destroy]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    
  end

  def edit
    
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.order.blank? && @item.user.id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:product, :description, :price, :image, :category_id, :state_id, :delivery_fee_burden_id , :area_id , :day_id).merge(user_id:current_user.id)
  end

  def present
    if @item.order.present? || @item.user.id != current_user.id
      redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
