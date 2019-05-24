class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render html: "Welcome to the in-progress Stardew Valley app!"
  end
end
