class OrdersController < ApplicationController

  def index
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.save
  end

  private

  def order_params
    params.permit(:price, :token)
  end

end
