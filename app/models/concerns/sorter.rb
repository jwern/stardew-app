module Sorter
  def search(search)
    where('name ILIKE ?', "%#{search}%")
  end

  def filter(type, filter)
    where(type => filter)
  end
end
