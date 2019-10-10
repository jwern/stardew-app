module ApplicationHelper
  def comma_link_list(object_list)
    object_list.map do |object|
      link_to object.name, [@game, object]
    end.join(", ").html_safe
  end

  def titleize_image_link(path)
    path.gsub(/[^a-zA-Z0-9\-]/, "").titleize.tr(" ", "")
  end
end
