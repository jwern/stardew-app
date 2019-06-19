class Preference < ApplicationRecord
  belongs_to :villager
  belongs_to :item

  OPINIONS = [
    "Likes",
    "Dislikes"
  ]

  validates_uniqueness_of :villager_id, scope: :item_id, message: "preference is already set"
  validates :opinion, inclusion: { in: OPINIONS }
  #validates :item_id, inclusion: { in: Item.pluck(:id) }
  #validates :villager_id, inclusion: { in: Villager.pluck(:id) }
end
