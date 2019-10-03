module ApplicationHelper
  def comma_link_list(item_list)
    item_list.map do |item|
      link_to item.name, game_item_path
    end.join(", ").html_safe
  end
end
