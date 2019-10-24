class Item < ApplicationRecord
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to :prefecture
  belongs_to :category
  belongs_to :brand
end
