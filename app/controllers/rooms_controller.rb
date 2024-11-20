class RoomsController < ActionController::Base

  def new
  end

  def create
    @room = Room.new(name:params['name'], password: params['password'], password_confirmation: params['password_confirmation'])
    @room.save
    redirect_to("/rooms/#{@room.uuid}")
  end

  def show
    @room = Room.find_by(uuid: params['id'])
  end


end