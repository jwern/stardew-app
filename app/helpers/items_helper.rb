module ItemsHelper
  def item_pic(name)
    if File.exist?(Rails.root.join("app/assets/images/items/#{name.titleize}.png"))
      image_tag "items/#{name.titleize}.png", alt: "#{name} picture"
    else
      image_tag "items/placeholder.png"
    end
  end
end
