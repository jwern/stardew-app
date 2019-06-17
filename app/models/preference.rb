class Preference < ApplicationRecord
  belongs_to :villager
  belongs_to :item

  OPINIONS = [
    "Likes",
    "Dislikes"
  ]

  validates_uniqueness_of :villager_id, scope: :item_id, message: "preference is already set"
  validates :opinion, presence: true, inclusion: { in: OPINIONS }
  validates :item, inclusion: { in: Item.all }
  validates :villager, inclusion: { in: Villager.all }
end
