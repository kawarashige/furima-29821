class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  # validates :first_name, presence: true
  # validates :first_name_kana, presence: true
  # validates :last_name, presence: true
  # validates :last_name_kana, presence: true
  # validates :nickname, presence: true
  # validates :birth_day, presence: true
  # validates :email, presence: true
  # validates :password, presence: true

  with_options presence: true do
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :first_name_kana, format: { with: /\A[ァ-ヶ一ー]+\z/}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/}
    validates :last_name_kana, format: { with: /\A[ァ-ヶ一ー]+\z/}
    validates :nickname
    validates :birth_day
    validates :email, uniqueness: true
    validates :email, inclusion: { in: %W(@) }
    validates :password, confirmation: true
    validates :password, length: { minimum: 6 }
    PASSWORD = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD
  end

end
