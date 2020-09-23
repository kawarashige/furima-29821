class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 0, message: "Select" } do
    validates           :category_id
    validates           :sales_status_id
    validates           :shipping_fee_status_id
    validates           :scheduled_delivery_id
  end

  validates             :price,              numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }

end
