class Preference < ApplicationRecord
  belongs_to :villager
  belongs_to :item
end
