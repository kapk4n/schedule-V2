class PasswordsController < ApplicationController
  before_action :require_user_logged_in!

  def edit
  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password changed"
    else
      flash[:alert] = "no match"
      redirect_to edit_password_path
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end