class OrdersController < ItemsController

  def index
    @order = Order.new
    @item = Item.find(item_params[:item_id])
  end

  def create
    @order_save = Order.new(order_params)
    @order_save.save
  end

  private

  def item_params
    params.permit(:item_id)
  end

  def order_params
    params.require(:order).permit(
      :price, :token, :postal_code, :city, :addresses, :phone_number, :prefecture_id,
    )
  end

end
