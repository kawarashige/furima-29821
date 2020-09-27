class OrderAddress < ApplicationRecord

  belongs_to :user
  belongs_to :item
  has_one    :address

  include ActiveModel::Model
  include ActiveModel::AttributeAssignment

  attr_accessor :price, :token, :postal_code, :prefecture_id, :city, :addresses, :phone_number,
                :nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day,
                :image, :name, :info, :price, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly'}
    validates :city
    validates :addresses
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { minimum: 6 }
  end

  validates :prefecture_id, numericality: { only_integer: true, other_than: 0, message: 'Select' }

  def save
    user = User.create(nickname: nickname, email: email, password: password, first_name: first_name, last_name: last_name, first_name_kana: first_name_kana, last_name_kana: last_name_kana, birth_day: birth_day)
    item = Item.create(image: image, name: name, info: info, price: price, category_id: category_id, sales_status_id: sales_status_id, shipping_fee_status_id: shipping_fee_status_id, prefecture_id: prefecture_id, scheduled_delivery_id: scheduled_delivery_id)
    delivery = Order.create(user_id: user.id, item_id: item.id)
    @order = Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, addresses: addresses, phone_number: phone_number, order_id: delivery.id)

    if @order.valid?
      pay_item
      @oder.save
      redirect_to root_path
    else
      render 'index'
    end

    private
    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: order_params[:price],
        card: order_params[:token],
        currency: 'jpy'
      )
    end

  end

end