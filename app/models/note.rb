class Note < ApplicationRecord
  NOTE_TYPES = [
    "Farming",
    "Mining",
    "Relationships",
    "General"
  ]

  def self.sort_by_type
    note_types_hash = NOTE_TYPES.each_with_object({}) { |type, hash| hash[type] = [] }
    Note.all.each { |n| note_types_hash[n.info_type] << n }
    note_types_hash
  end
end

##WORKS
#note_types_hash = NOTE_TYPES.each_with_object({}) { |type, hash| hash[type] = [] }
#Note.all.each { |n| note_types_hash[n.info_type] << n.additional_info }
#note_types_hash

#NOTE_TYPES.each { |type| note_types_hash[type] = [] }
