class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end


  def new
    @item = UserItem.new
  end

  def created
    @item = UserItem.new(item_params)
    @item.save
  end

  private

  def item_params
    params.require(:user_item).permit(:name, :info, :category, :sales_status, :shipping_fee_status, :scheduled_delivery, :price)
  end

end
