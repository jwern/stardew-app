class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  end

  # This was an overly complex solution to what turned out to be a fairly simple
  # problem: I needed to get @game into the preference controller without
  # it being nested within it.
  # def get_preferred(parent, type)
  #   if type == "items"
  #     parent.items
  #   elsif type == "villagers"
  #     parent.villagers
  #   end
  # end
end
