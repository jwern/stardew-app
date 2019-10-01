class Villager < ApplicationRecord
  extend Sorter
  has_many :preferences, dependent: :destroy
  has_many :items, through: :preferences
  belongs_to :game

  ## Search and Filter have been moved to the sorter.rb concern / module
  # def self.search(search)
  #     #item = Item.find_by(name: search.titleize)
  #     #item ? self.where(name:search.titleize) : Item.all
  #   where('name ILIKE ?', "%#{search}%")
  # end

  # def self.filter(filter)
  #   where(birth_season: filter)
  # end

  BIRTH_SEASONS = %w(Spring Summer Fall Winter)
  BIRTH_DAYS = (1..30).to_a

  validates :name, { presence: true, uniqueness:
                                    { case_sensitive: false,
                                      message: "already exists" } }
  validates :birth_season, inclusion: { in: BIRTH_SEASONS,
    message: "%{value} is not a valid season" }
  validates :birth_day, inclusion: { in: BIRTH_DAYS,
    message: "%{value} is not a valid date" }
end
