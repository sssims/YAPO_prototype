class UsersController < ApplicationController
  protect_from_forgery

  def new

    @user = User.new

  end

  def create

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to :controller => 'home', :action => 'index'
    else
      render 'new'
    end

  end

  def user_params
    params.require(:user).permit(:username, :password, :enc_pword, :salt)
  end

  def login

  end

  def login_attempt
   
    authorized_user = User.authenticate(params[:user][:username_or_email], params[:user][:login_password])

    if authorized_user
      session[:user_id] = authorized_user.id
      redirect_to(:controller => 'home', :action => 'index')
    else
      render 'login'
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to(:controller => 'home', :action => 'index')
  end

end
