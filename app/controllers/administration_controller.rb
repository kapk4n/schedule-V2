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
    if params[:commit] == 'Edit'
      if !User.find_by(id: params[:id]).nil? && User.find_by(id: params[:id]).role != 'admin'
        @user = User.find_by(id: params[:id])
        redirect_to editrole_new_path(role: params[:role], id: params[:id]), notice: "Your #{@user.email} has role: #{@user.role}"
      else
        redirect_to administration_path, alert: "Invalid id"
      end
    elsif params[:commit] == 'Delete'
      if !User.find_by(id: params[:id]).nil? && User.find_by(id: params[:id]).role != 'admin'
        @user = User.find_by(id: params[:id])
        redirect_to administration_path, notice: "Sucsessfully deleted"
        @user.destroy
      else
        redirect_to administration_path, alert: "Invalid id"
      end
    elsif params[:commit] == 'Create'
      redirect_to creatinguser_new_path
    end
  end

  private

  def checking_id
    params.require(:user).permit(params[:id])
  end
end
