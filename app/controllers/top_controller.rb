class TopController < ActionController::Base
  layout "application"

  def index
    session[:id] = nil
  end


end