class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.student!
      # Predmet.ids.each do |qr|
      #   List.create(user_id: @user.id, predmet_id: qr, spisok: '')
      # end
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else
      flash[:alert] = "Invalid"
      redirect_to sign_up_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end