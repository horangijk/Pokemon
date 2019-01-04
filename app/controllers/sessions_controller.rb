class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to users_path
    else
      # flash[:errors] = "Invalid name or password."
      redirect_to new_session_path
    end
  end

  def edit
    @user = User.new
  end

  def update
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user_id
      redirect_to users_path
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    redirect_to new_session_path
  end

end
