class Villager < ApplicationRecord
  BIRTH_SEASONS = %w(Spring Summer Fall Winter)
  BIRTH_DAYS = (1..30).to_a

  validates :birth_season, inclusion: { in: BIRTH_SEASONS,
    message: "%{value} is not a valid season" }
  validates :birth_day, inclusion: { in: BIRTH_DAYS,
    message: "%{value} is not a valid date" }
end
