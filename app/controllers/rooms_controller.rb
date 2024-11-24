class RoomsController < ActionController::Base
  layout "application"
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
    Room.find_by(uuid: session[:id])
  end

  def new
    session[:id] = nil
  end

  def create
    if params['password'] == params['password_confirmation']
      @room = Room.new(name:params['name'], password: params['password'], password_confirmation: params['password_confirmation'])
      @room.save
      session[:id] = @room.uuid
      redirect_to("/rooms/#{@room.uuid}")
    else
      @error_message = "パスワードが間違っています"
      render('/rooms/new')
    end
  end

  def edit
    @room = Room.find_by(uuid: params['id'])
  end

  def update
    @room = Room.find_by(uuid: params['id'])
    @room.name = params['name']
    @room.save
    redirect_to("/rooms/#{@room.uuid}")
  end

  def delete
    @room = Room.find_by(uuid: params['id'])
    Member.where(room_key: @room.uuid).delete_all
    Room.find_by(uuid: params['id']).delete

  end

  def login_form
  end

  def login
    @room = Room.find_by(uuid: params['id'])

    if @room
      if @room.authenticate(params['password'])
        session[:id] = @room.uuid
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
    session[:id] = nil
    redirect_to('/')
  end

  def show
    @room = Room.find_by(uuid: params['id'])
    @members = Member.where(room_key:@room.uuid).order({status: :desc}, {updated_at: :desc})
  end


end