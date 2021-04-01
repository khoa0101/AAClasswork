class Api::SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      flash.now[:errors] = ['Invalid username or password.']
      render :new
    else
      login!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    @user = current_user
    if @user
      logout!
      redirect_to new_session_url
    else
      render json:["error"], status: 404
    end
  end
end
