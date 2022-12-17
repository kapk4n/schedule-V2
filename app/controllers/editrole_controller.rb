class EditroleController < ApplicationController
  before_action :require_user_logged_in!
  before_action :require_user_admin!

  def new
    @users_all = User.roles.except(:admin)
  end

  def created
    @ro = params[:role]
    user = User.find_by(id: params[:id])
    if (@ro == '1' || @ro == '0') && (!User.find_by(id: params[:id]).nil? && User.find_by(id: params[:id]).role != 'admin')
      user.update(role: @ro.to_i)
      if user.student?
        Teach.find_by(user_id: user.id).destroy
        jcreate(user)
      end
      if user.teacher?
        # List.where(stud_id: user.stud.first.id).delete
        Stud.find_by(user_id: user.id).destroy
        Teach.create(user_id: user.id)
      end
      redirect_to administration_path, notice: "You edited user #{user.email} role to #{user.role}"
    else
      redirect_to edrole_path, notice: 'Invalid role or id'
    end
  end

  private

  def jcreate(user)
    st = Stud.create(user_id: user.id)
    a = []
    6.times do
      a.push('')
    end
    las = Predmet.ids
    las.each do |qr|
      List.create(spisok: ActiveSupport::JSON.encode(a), predmet_id: qr, stud_id: st.id)
    end
  end
end
