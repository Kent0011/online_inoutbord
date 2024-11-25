class TopController < ActionController::Base
  layout "application"

  def index
    session[:id] = nil
  end

  def iphone
  end

  def android
  end

end