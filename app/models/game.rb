class Game < ApplicationRecord
  extend Sorter
  has_many :items, dependent: :destroy
  has_many :villagers, dependent: :destroy
  has_many :notes, dependent: :destroy

  COLORS = {
    "Blue/red" => "blue-red",
    "Muted blue/red" => "muted-blue-red",
    "Yellow/blue" => "yellow-blue",
    "Burnt orange/blue" => "burnt-orange-blue",
    "Green/green" => "green-green",
    "Forest green" => "forest-green",
    "Fuschia/green" => "fuschia-green",
    "Purple/olive" => "purple-olive",
    "Royal purple/lavender" => "royal-purple-lavender",
    "Pink/dark pink" => "pink-pink",
    "Brown/blue" => "brown-blue",
    "Gray/brown" => "gray-brown",
    "Gray/pink" => "gray-pink"
  }

  validates :name, { presence: true, uniqueness:
                                    { case_sensitive: false,
                                      message: "already exists" } }
  validates :color_choice, inclusion: { in: COLORS.values, message: "%{value} is not a valid color palette" }
end
