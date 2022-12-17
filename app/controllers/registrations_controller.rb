class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.student!
      st = Stud.create(user_id: @user.id)
      jcreate(@user, st)
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully created account"
    else
      flash[:alert] = "Invalid"
      redirect_to sign_up_path
    end
  end

  private

  def jcreate(user, st)
    a = []
    6.times do
      a.push('')
    end
    las = Predmet.ids
    las.each do |qr|
      List.create(spisok: ActiveSupport::JSON.encode(a), predmet_id: qr, stud_id: st.id)
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end