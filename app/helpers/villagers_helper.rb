module VillagersHelper
  def headshot(game_name, villager_name)
    if File.exists?(Rails.root.join("app/assets/images/#{titleize_image_link(game_name)}/villagers/#{titleize_image_link(villager_name)}.png"))
      image_tag "#{titleize_image_link(game_name)}/villagers/#{titleize_image_link(villager_name)}.png", alt: "#{villager_name} headshot", class: "headshot"
    elsif File.exists?(Rails.root.join("app/assets/images/#{titleize_image_link(game_name)}/villagers/placeholder.png"))
      image_tag "#{titleize_image_link(game_name)}/villagers/placeholder.png", alt: "#{villager_name} headshot", class: "headshot"
    else
      image_tag "villagers/placeholder.png", class: 'headshot'
    end
  end
end
