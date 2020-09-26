class OrderAddress

  include ActiveModel::ActiveModel
  attr_accessor :token

  with_options presence: true do
    validates :token
    validates :postal_code
    validates :prefecture_id
    validates :city
    validates :addresses
    validates :phone_number
  end
  
end