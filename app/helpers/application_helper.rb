module ApplicationHelper
  def comma_link_list(object_list)
    object_list.map do |object|
      link_to object.name, [@game, object]
      # if item.is_a?(Villager)
      #   link_to item.name, game_villager_path(@game, item)
      # elsif item.is_a?(Item)
      #   link_to item.name, game_item_path(@game, item)
      # end
    end.join(", ").html_safe
  end
end
