class UsersController < ActionController::Base

  def show
    @user = User.find(params["id"])
  end

  def new
  end

  def create
    @user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
    @user.save
    session[:user_id] = @user.id
    redirect_to("/users/#{@user.id}")
  end

  def login_form
  end

  def login
    @user = User.find_by(name: params[:name], email: params[:email])

    if @user
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to("/users/#{@user.id}")
      else
        @error_message = "メールアドレスまたはパスワードが間違っています"
        render("users/login_form")
      end
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render("users/login_form")
    end
  end

end