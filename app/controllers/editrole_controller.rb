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
      if user.student? && @ro == '1'
        Stud.find_by(user_id: user.id).destroy
        Teach.create(user_id: user.id)
      end
      if user.teacher? && @ro == '0'
        unless Predmet.find_by(teach_id: user.teach.first.id).nil?
          pred_id = Predmet.find_by(teach_id: user.teach.first.id)
          Schedule.where(predmet_id: pred_id.id).destroy_all unless Schedule.find_by(predmet_id: pred_id.id).nil?
          List.where(predmet_id: pred_id.id).destroy_all unless List.find_by(predmet_id: pred_id.id).nil?
          pred_id.destroy unless pred_id.nil?

        end
        Teach.find_by(user_id: user.id).destroy
        jcreate(user)
      end
      user.update(role: @ro.to_i)
      redirect_to administration_path, notice: "#{t('.notice1')} #{user.email} #{t('.notice2')} #{user.role}"
    else
      redirect_to editrole_new_path(id: params[:id]), alert: "#{t('.alert')}"
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
