class Item < ApplicationRecord
  extend Sorter
  has_many :preferences, dependent: :destroy
  has_many :villagers, through: :preferences
  belongs_to :game

  CATEGORIES = [
    "Animal Products",
    "Artifacts",
    "Artisan Goods",
    "Cooked Dishes",
    "Fish",
    "Flowers",
    "Fruit",
    "Minerals",
    "Trash",
    "Vegetables"
  ]

  validates :name, { presence: true, uniqueness:
                                    { scope: :game,
                                      case_sensitive: false,
                                      message: "already exists" }
}
  validates :category, inclusion: { in: CATEGORIES }
  validates :sale_price, numericality: { only_integer: true }, allow_blank: true
end
