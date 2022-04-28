class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
  end

  def logout
    session.clear
    redirect_to '/login'
  end

  def login

  end

  def welcome

  end

  def create
    @user = User.find_by(username: params[:username])
    if @user
      session[:user_id] = @user.id
      redirect_to new_adboard_path
    else
      redirect_to '/login'
    end
  end

end
