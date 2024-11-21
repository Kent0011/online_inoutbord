class TopController < ActionController::Base
  layout "application"

  def index
    session[:room_id] = nil
  end


end