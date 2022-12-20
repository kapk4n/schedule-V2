# frozen_string_literal:true

# creating admin controller
class AdministrationController < ApplicationController
  before_action :require_user_logged_in!
  before_action :require_user_admin!

  def edit
    @users_ids = User.ids
    @users_all = User.all
  end

  def update
    com = params[:commit]
    if com == 'Edit' || com == 'Изменить'
      @user = User.find_by(id: params[:id])
      if_edit(params[:id], params[:role])
    elsif com == 'Delete' || com == 'Удалить'
      if_delete(params[:id])
    elsif com == 'Create' || com == 'Создать'
      redirect_to creatinguser_new_path
    elsif com == 'Create Subject' || com == 'Cоздать Предмет'
      redirect_to ed_subject_edit_path
    elsif com == 'Edit Subject' || com == 'Изменить Предмет'
      redirect_to ed_sub_ed_path
    end
  end

  private

  def if_edit(id, role)
    if !User.find_by(id: id).nil? && User.find_by(id: id).role != 'admin'
      user = User.find_by(id: id)
      redirect_to editrole_new_path(role: role, id: id), notice: "#{user.email} #{t('administration.ne.notice1')} #{user.role}"
    else
      redirect_to administration_path, alert: "#{t('administration.ne.error1')}"
    end
  end

  def if_delete(id)
    if !User.find_by(id: id).nil? && User.find_by(id: id).role != 'admin'
      user = User.find_by(id: id)
      redirect_to administration_path, notice: "#{t('administration.ne.notice2')}"
      if user.teacher?
        unless Predmet.find_by(teach_id: user.teach.first.id).nil?
          pred_id = Predmet.find_by(teach_id: user.teach.first.id)
          Schedule.where(predmet_id: pred_id.id).destroy_all unless Schedule.find_by(predmet_id: pred_id.id).nil?
          List.where(predmet_id: user.teach.first.predmet.id).destroy_all unless List.find_by(predmet_id: user.teach.first.predmet.id).nil?
          pred_id.destroy
        end
      end
        user.destroy
    else
      redirect_to administration_path, alert: "#{t('administration.ne.error1')}"
    end
  end

  def checking_id
    params.require(:user).permit(params[:id])
  end
end
