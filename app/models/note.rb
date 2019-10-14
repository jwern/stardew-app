class Note < ApplicationRecord
  belongs_to :game

  NOTE_TYPES = [
    "Farming",
    "Mining",
    "Relationships",
    "General"
  ]

validates :additional_info, presence: { message: "cannot be blank" }

  def self.sort_by_type
    Note.all.group_by(&:info_type)
  end
end
