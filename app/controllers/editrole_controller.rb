class EditroleController < ApplicationController
  before_action :require_user_logged_in!
  before_action :require_user_admin!

  def new
    @users_all = User.roles.except(:admin)
    #  = User.find_by(id: params[:id])
  end

  def created
    @ro = params[:role]
    # redirect_to edrole_path, notice: "Invalid role or id#{@ro}   #{params[:id]}"
    user = User.find_by(id: params[:id])
    if (@ro == '1' || @ro == '0') && (!User.find_by(id: params[:id]).nil? && User.find_by(id: params[:id]).role != 'admin')
      user.update(role: @ro.to_i)
      redirect_to administration_path, notice: "You edited user #{user.email} role to #{user.role}"
    else
      redirect_to edrole_path, notice: 'Invalid role or id'
    end
  end
end
