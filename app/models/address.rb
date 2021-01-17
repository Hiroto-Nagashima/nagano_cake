class Address < ApplicationRecord
  belongs_to :customer
  validates :postal_code, length: { is: 7 }
  validates :postal_code, format: { with: /\A[0-9]+\z/}
  validates :name, format: { with: /\A[一-龥ぁ-ん]/}

end
