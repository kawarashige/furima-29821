class UserItem

  include ActiveModel::Model
  attr_accessor :nickname, :email, :password, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_day, :name, :info, :price

  with_options presence: true do
    validates           :nickname
    validates           :email,             uniqueness: true
    validates           :password,          length: { minimum: 6 }

    PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password,          with: PASSWORD, message: 'Include both letters and numbers'

    validates           :first_name,        format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
    validates           :last_name,         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
    validates           :first_name_kana,   format: { with: /\A[ァ-ヶ一ー]+\z/, message: 'Full-width katakana characters' }
    validates           :last_name_kana,    format: { with: /\A[ァ-ヶ一ー]+\z/, message: 'Full-width katakana characters' }
    validates           :birth_day
    validates           :name
    validates           :info
    validates           :price,             format: { with: /\A[0-9]+\z/, message: "Half-width number" }
  end

  with_options numericality: { only_integer: true, other_than: 0, message: "Select" } do
    validates           :category
    validates           :salse_status
    validates           :shipping_fee_status
    validates           :scheduled_delivery
  end

  validates             :price,              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "Out of setting range" }

end