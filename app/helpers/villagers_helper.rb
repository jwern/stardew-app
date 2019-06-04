module VillagersHelper
  def headshot(name)
    if File.exist?(Rails.root.join("app/assets/images/#{name.titleize}.png"))
      image_tag "#{name.titleize}.png", alt: "#{name} headshot", class: 'headshot'
    else
      image_tag "placeholder.png", class: 'headshot'
    end
  end
end
