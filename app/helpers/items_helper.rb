module ItemsHelper
  def item_pic(name)
    if File.exist?(Rails.root.join("app/assets/images/items/#{name.titleize.tr(" ", "")}.png"))
      image_tag "items/#{name.titleize.tr(" ", "")}.png", alt: "#{name} picture", class: "item-pic"
    else
      image_tag "items/placeholder.png", class: "item-pic"
    end
  end
end
