module ItemsHelper
  def item_pic(game_name, item_name)
    if File.exists?(Rails.root.join("app/assets/images/#{titleize_image_link(game_name)}/items/#{titleize_image_link(item_name)}.png"))
      image_tag "#{titleize_image_link(game_name)}/items/#{titleize_image_link(item_name)}.png", alt: "#{item_name} picture", class: "item-pic"
    elsif File.exists?(Rails.root.join("app/assets/images/#{titleize_image_link(game_name)}/items/placeholder.png"))
      image_tag "#{titleize_image_link(game_name)}/items/placeholder.png", alt: "#{item_name} picture", class: "item-pic"
    else
      image_tag "items/placeholder.png", class: "item-pic"
    end
  end
end
