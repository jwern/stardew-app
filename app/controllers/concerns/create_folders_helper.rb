module CreateFoldersHelper
  private
    def create_game_folder(name)
      Dir.mkdir("app/assets/images/#{titleize_image_link(name)}") unless File.exists?("app/assets/images/#{titleize_image_link(name)}")
      Dir.mkdir("app/assets/images/#{titleize_image_link(name)}/villagers") unless File.exists?("app/assets/images/#{titleize_image_link(name)}/villagers")
      Dir.mkdir("app/assets/images/#{titleize_image_link(name)}/items") unless File.exists?("app/assets/images/#{titleize_image_link(name)}/items")
      FileUtils.cp "app/assets/images/villagers/placeholder.png", "app/assets/images/#{titleize_image_link(name)}/villagers"
      FileUtils.cp "app/assets/images/items/placeholder.png", "app/assets/images/#{titleize_image_link(name)}/items"
    end

    def edit_game_folder(old_name, new_name)
      FileUtils.mv "app/assets/images/#{titleize_image_link(old_name)}", "app/assets/images/#{titleize_image_link(new_name)}"
    end

    # def delete_game_folder(name)
    #   FileUtils.rm_rf("app/assets/images/#{titleize_image_link(name)}")
    # end
end
