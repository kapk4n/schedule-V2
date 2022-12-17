class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: "You mast be signeed in to do" if Current.user.nil?
  end

  def require_user_admin!
    redirect_to sign_in_path, alert: "You mast be signeed in to do" if Current.user.nil?
    redirect_to root_path, alert: "You don't have prava" if (Current.user.role != "admin" )
  end

  def require_user_teacher!
    redirect_to sign_in_path, alert: "You mast be signeed in to do" if Current.user.nil?
    redirect_to root_path, alert: "You are not a teacher" if (Current.user.role != "teacher" )
  end
end
