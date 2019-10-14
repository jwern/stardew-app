class Villager < ApplicationRecord
  extend Sorter
  has_many :preferences, dependent: :destroy
  has_many :items, through: :preferences
  belongs_to :game

  BIRTH_SEASONS = %w(Spring Summer Fall Winter)
  BIRTH_DAYS = (1..30).to_a

  validates :name, { presence: true, uniqueness:
                                    { scope: :game,
                                      case_sensitive: false,
                                      message: "already exists" } }
  validates :birth_season, inclusion: { in: BIRTH_SEASONS,
    message: "%{value} is not a valid season" }
  validates :birth_day, inclusion: { in: BIRTH_DAYS,
    message: "%{value} is not a valid date" }
end
