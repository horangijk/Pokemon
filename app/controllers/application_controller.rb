class ApplicationController < ActionController::Base
  before_action :setup_global_errors, :setup_user_stuff
  def setup_global_errors
    @errors = flash[:errors]
  end

  def setup_user_stuff
    if session["user_id"]
      @logged_in_user = User.find(session["user_id"])
    end
  end

  def log_in!(user)
    session[:user_id] = @user.id
  end

  def logged_in?
    !!session[:user_id]
  end
end
