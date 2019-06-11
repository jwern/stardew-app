class Item < ApplicationRecord
  has_many :preferences
  has_many :villagers, through: :preferences
  
  CATEGORIES = [
    "Animal Products",
    "Artifacts",
    "Crops",
    "Fish",
    "Furniture",
    "Minerals",
    "Weapons"
  ]

  validates :name, { presence: true, uniqueness:
                                    { case_sensitive: false,
                                      message: "already exists" }
}
  validates :category, inclusion: { in: CATEGORIES }
  validates :sale_price, numericality: { only_integer: true }, allow_blank: true
end
