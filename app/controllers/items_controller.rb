class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end


  def new
    @item = UserItem.new
  end

  def create
    # binding.pry
    @item = UserItem.new(item_params)
    @item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:user_item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :scheduled_delivery_id, :price)
  end

end

