class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end


  def new
  end

  def created
  end

  private

  def item_params

  end
end
