class Item < ApplicationRecord
  extend Sorter
  has_many :preferences, dependent: :destroy
  has_many :villagers, through: :preferences
  belongs_to :game

  ## Search and Filter have been moved to the sorter.rb concern / module
  # def self.search(search)
  #     #item = Item.find_by(name: search.titleize)
  #     #item ? self.where(name:search.titleize) : Item.all
  #   where('name ILIKE ?', "%#{search}%")
  # end

  # def self.filter(filter)
  #   where(category: filter)
  # end

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
