module VillagersHelper
  def headshot(name)
    if File.exist?(Rails.root.join("app/assets/images/villagers/#{name.titleize}.png"))
      image_tag "villagers/#{name.titleize}.png", alt: "#{name} headshot", class: "headshot"
    else
      image_tag "villagers/placeholder.png", class: 'headshot'
    end
  end
end
