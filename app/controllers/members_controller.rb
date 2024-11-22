class MembersController < ActionController::Base
  layout "application"
  before_action :correct_room

  def correct_room
    if current_room
      unless current_room.uuid == params['id']
        redirect_to('/rooms/login_form')
      end
    else
      redirect_to('/rooms/login_form')
    end
  end

  def current_room
    Room.find_by(uuid: session[:id])
  end

  def new
    @room = Room.find_by(uuid: params['id'])
  end

  def create
    @room = Room.find_by(uuid: params['id'])
    @member = Member.new(room_id: @room.uuid, name: params['name'])
    @member.save
    redirect_to("/rooms/#{@room.uuid}")
  end

end
