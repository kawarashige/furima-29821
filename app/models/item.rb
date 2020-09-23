class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :sales_status
  belongs_to_active_hash :shipping_fee_status
  belongs_to_active_hash :scheduled_delivery
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates           :name
    validates           :info
    validates           :price, format: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  end

  with_options numericality: { only_integer: true, other_than: 0, message: 'Select' } do
    validates           :category_id
    validates           :sales_status_id
    validates           :shipping_fee_status_id
    validates           :scheduled_delivery_id
  end

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
