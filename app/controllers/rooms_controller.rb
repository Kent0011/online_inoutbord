class RoomsController < ActionController::Base

  def new
  end

  def create
    @room = Room.new(name:params['name'], password: params['password'], password_confirmation: params['password_confirmation'])
    @room.save
    redirect_to("/rooms/#{@room.uuid}")
  end

  def login_form
  end

  def login
    @room = Room.find_by(uuid: params['id'])

    if @room
      if @room.authenticate(params['password'])
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

  def show
    @room = Room.find_by(uuid: params['id'])
  end


end