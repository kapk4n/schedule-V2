class PoseshaemostController < ApplicationController
  before_action :require_user_logged_in!

  def show
    @user_em = []
    user_all = User.student
    user_stud = User.student.ids
    pred = Predmet.all
    @list_pred = []
    pred.ids.each do |re|
      @list_pred.push(Predmet.find_by(id: re).name)
    end

    user_stud.each do |qr|
      @user_em.push(user_all.find_by(id: qr).email)
    end
  end

  def open
    @i = 0
    @pred = params[:name]

    # @idex = [0, 1]
    @user = User.find_by(email: params[:email])
    @studs = Stud.all
  end

  def jedit
  end
end
