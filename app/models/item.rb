class Item < ApplicationRecord
  CATEGORIES = [
    "Animal Products",
    "Artifacts",
    "Crops",
    "Fish",
    "Furniture",
    "Minerals",
    "Weapons"
  ]
  
  validates :name, presence: true
end
