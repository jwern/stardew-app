class Game < ApplicationRecord
  extend Sorter
  has_many :items, dependent: :destroy
  has_many :villagers, dependent: :destroy
  has_many :notes, dependent: :destroy

  COLORS = {
    "Blue/red" => "blue-red",
    "Yellow/blue" => "yellow-blue",
    "Fuschia/green" =>"fuschia-green"
  }

  validates :name, { presence: true, uniqueness:
                                    { case_sensitive: false,
                                      message: "already exists" } }
  validates :color_choice, inclusion: { in: COLORS.values,
    message: "%{value} is not a valid color palette" }
end
