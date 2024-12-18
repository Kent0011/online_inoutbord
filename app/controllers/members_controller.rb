class MembersController < ActionController::Base
  layout "application"
  before_action :correct_room

  def correct_room
    if current_room
      unless current_room.uuid == params['id']
        redirect_to("/rooms/#{params['id']}/login")
      end
    else
      redirect_to("/rooms/#{params['id']}/login")
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
    if params['name'] == ''
      @error_message = "名前を入力してください"
      render :new
    else
      @member = Member.new(room_key: @room.uuid, name: params['name'])
      @member.save
      redirect_to("/rooms/#{@room.uuid}")
    end
  end

  def show
    @room = Room.find_by(uuid: params['id'])
    @member = Member.find_by(id: params['member_id'])
  end

  def edit
    @room = Room.find_by(uuid: params['id'])
    @member = Member.find_by(id: params['member_id'])
  end

  def update
    @room = Room.find_by(uuid: params['id'])
    @member = Member.find_by(id: params['member_id'])
    if params['name'] == ''
      @error_message = "名前を入力してください"
      render :edit
    else
      @member.name = params['name']
      @member.save
      redirect_to("/rooms/#{@room.uuid}/members/#{@member.id}")
    end
  end

  def delete
    @room = Room.find_by(uuid: params['id'])
    Member.find_by(id: params['member_id']).delete
    redirect_to("/rooms/#{@room.uuid}")
  end

  def arrive
    @room = Room.find_by(uuid: params['id'])
    @member = Member.find_by(id: params['member_id'])
    @member.status = true
    @member.save
    redirect_to("/rooms/#{@room.uuid}")
  end

  def leave
    @room = Room.find_by(uuid: params['id'])
    @member = Member.find_by(id: params['member_id'])
    @member.status = false
    @member.save
    redirect_to("/rooms/#{@room.uuid}")
  end

end
