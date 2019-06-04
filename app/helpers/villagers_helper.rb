module VillagersHelper
  def headshot(name)
    if File.exists?(Rails.root.join("app/assets/images/#{name}.png"))
      image_tag "#{name}.png", alt: "#{name} headshot", class: 'headshot'
    else
      image_tag "placeholder.png", class: 'headshot'
    end
  end
end
