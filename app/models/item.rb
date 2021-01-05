class Item < ApplicationRecord
  belongs_to :genres
  attachment :image
end
