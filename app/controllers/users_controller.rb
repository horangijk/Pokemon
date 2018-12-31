class UsersController < ApplicationController
  before_action :authenticate, only: [:destroy, :edit]
  def index
      @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new

    @errors = flash[:errors] || []
    # we're supposed to comment this out because we set up setup_global_errors
  end

  def create

    @user = User.new(user_params)
    if @user.save
      session["user_id"] = @user_id
      redirect_to "/users"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    User.destroy(params[:id])
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :username, :password)
  end

  def authenticate
    redirect_to new_session_path unless logged_in?
  end

end
