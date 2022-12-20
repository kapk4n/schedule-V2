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
      st = Stud.create(user_id: @user.id)
      jcreate(@user, st)
      redirect_to administration_path, notice: "#{t('creatinguser.notice')}"
    else
      redirect_to creatinguser_new_path, alert: "#{t('creatinguser.error')}"
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
    params.require(:user).permit(:email, :name, :password, :password_confirmation)
  end
end