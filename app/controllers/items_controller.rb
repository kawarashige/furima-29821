class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    # binding.pry
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :prefecture_id, :category_id, :sales_status_id, :shipping_fee_status_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
