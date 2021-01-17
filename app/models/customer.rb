class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    enum is_active: { 有効:true, 退会:false}
    def active_for_authentication?
        super && (self.is_active === "有効")
    end
 has_many :cart_items
 has_many :addresses
 has_many :orders
 validates :password, confirmation: true
 validates :address, presence: true
 validates :telephone_number, length: { is: 11 }
 validates :postal_code, length: { is: 7 }
 validates :encrypted_password , length: { minimum: 6 }
 validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
 validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
 validates :first_name_kana, format: { with:/\A[ァ-ヶー－]+\z/}
 validates :last_name, format: { with: /\A[一-龥]+\z/}
 validates :first_name, format: { with: /\A[一-龥ぁ-ん]/}
end
