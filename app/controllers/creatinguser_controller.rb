class CreatinguserController < ApplicationController
  before_action :require_user_logged_in!
  before_action :require_user_admin!

  def new
    @user = User.new
  end

  def edit
    @user = User.new(user_params)
    if @user.save
      @user.student!
      Predmet.ids.each do |qr|
        List.create(user_id: @user.id, predmet_id: qr, spisok: '')
      end
        redirect_to administration_path, notice: "Successfully created account"
    else
      redirect_to creatinguser_new_path, alert: "Invalid"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end