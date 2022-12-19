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
    if com == 'Edit'
      @user = User.find_by(id: params[:id])
      if_edit(params[:id], params[:role])
    elsif com == 'Delete'
      if_delete(params[:id])
    elsif com == 'Create'
      redirect_to creatinguser_new_path
    end
  end

  private

  def if_edit(id, role)
    if !User.find_by(id: id).nil? && User.find_by(id: id).role != 'admin'
      user = User.find_by(id: id)
      redirect_to editrole_new_path(role: role, id: id), notice: "Your #{user.email} has role: #{user.role}"
    else
      redirect_to administration_path, alert: "Invalid id"
    end
  end

  def if_delete(id)
    if !User.find_by(id: id).nil? && User.find_by(id: id).role != 'admin'
      user = User.find_by(id: id)
      redirect_to administration_path, notice: "Sucsessfully deleted"
      user.destroy
    else
      redirect_to administration_path, alert: "Invalid id"
    end
  end

  def checking_id
    params.require(:user).permit(params[:id])
  end
end
