class ProfileController < ApplicationController
  before_action :require_user_logged_in!

  def edit
    @user = User.find_by(id: params[:id])
    @ind = 0
  end

  def edsubj
    @pred = Predmet.find_by(id: params[:id])
    @ind = 0
  end
end