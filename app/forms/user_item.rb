# class UserItem < ApplicationController

#   include ActiveModel::Model

#   attr_accessor :nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day, :image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :scheduled_delivery_id, :price

#   # before_action :configure_permitted_parameters, if: :devise_controller?

#   with_options presence: true do
#     validates           :name
#     validates           :info
#     validates           :price,             format: { with: /\A[0-9]+\z/, message: "Half-width number" }
#   end

#   with_options numericality: { only_integer: true, other_than: 0, message: "Select" } do
#     validates           :category_id
#     validates           :sales_status_id
#     validates           :shipping_fee_status_id
#     validates           :scheduled_delivery_id
#   end

#   validates             :price,              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }

#   def save
#     user = User.create(configure_permitted_parameters)
#     Item.create(image: image, name: name, info: info, category_id: category_id, sales_status_id: sales_status_id, shipping_fee_status_id: shipping_fee_status_id, scheduled_delivery_id: scheduled_delivery_id, price: price, user_id: user.id)
#   end

#   private

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :last_name_kana, :first_name, :first_name_kana, :nickname, :birth_day])
#   end

# end