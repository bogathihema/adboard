class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end


  def create
    @user = User.create(username: params[:user][:username], password_digest: params[:user][:password])
    session[:user_id] = @user.id
    redirect_to new_adboard_path
  end
end
