class ApiController < ActionController::Base
  skip_forgery_protection

  def arrive
    @room = Room.find_by(uuid: params['room_id'])
    @member = Member.find_by(id: params['member_id'])
    if @room.uuid == @member.room_key
      @member.status = true
      @member.save
      render json: {success: true}
    else
      render json: {success: false}
    end

  end

  def leave
    @room = Room.find_by(uuid: params['room_id'])
    @member = Member.find_by(id: params['member_id'])
    if @room.uuid == @member.room_key
      @member.status = false
      @member.save
      render json: {success: true}
    else
      render json: {success: false}
    end
  end

end
