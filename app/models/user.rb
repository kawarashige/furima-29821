class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  # with_options presence: true do
  #   validates           :nickname
  #   validates           :email,             uniqueness: true
  #   validates           :password,          length: { minimum: 6 }

  #   PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  #   validates_format_of :password,          with: PASSWORD, message: 'Include both letters and numbers'

  #   validates           :first_name,        format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
  #   validates           :last_name,         format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters' }
  #   validates           :first_name_kana,   format: { with: /\A[ァ-ヶ一ー]+\z/, message: 'Full-width katakana characters' }
  #   validates           :last_name_kana,    format: { with: /\A[ァ-ヶ一ー]+\z/, message: 'Full-width katakana characters' }
  #   validates           :birth_day
  # end
end
