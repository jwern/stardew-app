module PreferencesHelper
  def villager_name(villager_id)
    Villager.find(villager_id).name
  end

  def item_name(item_id)
    Item.find(item_id).name
  end
end
