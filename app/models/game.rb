class Game < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :villagers, dependent: :destroy

  validates :name, { presence: true, uniqueness:
                                    { case_sensitive: false,
                                      message: "already exists" } }
end
