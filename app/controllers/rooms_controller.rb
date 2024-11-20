class RoomsController < ActionController::Base
  before_action :correct_room, except: [:new, :create, :login_form, :login, :logout]

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
    Room.find_by(uuid: session[:room_id])
  end

  def new
  end

  def create
    @room = Room.new(name:params['name'], password: params['password'], password_confirmation: params['password_confirmation'])
    @room.save
    session[:room_id] = @room.uuid
    redirect_to("/rooms/#{@room.uuid}")
  end

  def login_form
  end

  def login
    @room = Room.find_by(uuid: params['id'])

    if @room
      if @room.authenticate(params['password'])
        session[:room_id] = @room.uuid
        redirect_to("/rooms/#{@room.uuid}")
      else
        @error_message = "IDまたはパスワードが間違っています"
        render('/rooms/login_form')
      end
    else
      @error_message = "IDまたはパスワードが間違っています"
      render('/rooms/login_form')
    end
  end

  def logout
    session[:room_id] = nil
    redirect_to('/')
  end

  def show
    @room = Room.find_by(uuid: params['id'])
  end


end