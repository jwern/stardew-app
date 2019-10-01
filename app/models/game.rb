class Game < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :villagers, dependent: :destroy
end
