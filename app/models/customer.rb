class Customer < ApplicationRecord
  enum is_active:{有効:true,退会:false}
  has_many:orders
end
