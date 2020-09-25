class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_show, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end


  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
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
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :prefecture_id, :category_id, :sales_status_id, :shipping_fee_status_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_show
    if user_signed_in? && @item.user.id != current_user.id
      redirect_to action: :index
    end
  end

end
