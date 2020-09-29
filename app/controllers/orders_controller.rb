class OrdersController < ItemsController
  before_action :set_item, only: [:index, :create]

  def index
    @order = OrderAddress.new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(item_params[:item_id])
  end

  def item_params
    params.permit(:item_id)
  end

  def order_params
    params.permit(
      :authenticity_token, :token, :postal_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :item_id
    ).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
