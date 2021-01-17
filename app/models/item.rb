class Item < ApplicationRecord
  belongs_to :genre
  has_many:order_items
  has_many :cart_items
  paginates_per 8
  attachment :image
  enum is_active: { 販売中:true, 販売停止中:false}

end
