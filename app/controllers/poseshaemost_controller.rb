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
    @studs = Stud.all
    @cur_us = Current.user
    replacing if params[:commit] == 'Edit' || params[:commit] == 'Изменить'
    @i = 0
    @pred = Predmet.find_by(name: params[:name])
    @user = User.find_by(email: params[:email])
  end

  def jedit
    @new_model = User.find_by(id: params[:id]).stud.first.list.find_by(predmet_id: params[:predmet_id])
    @i_dz = 0
    @i_rk = 0
  end

  private

  def replacing
    jupdate(params[:name], params[:id])
  end

  def jupdate(name, id)
    a = []
    i = 0
    6.times do
      if params[:"fs#{i}"].nil?
        a.push('')
      else
        a.push(params[:"fs#{i}"])
      end
      i += 1
    end
    las = Predmet.find_by(name: name).id
    list_i = List.find_by(predmet_id: las, stud_id: id)
    list_i.update(spisok: ActiveSupport::JSON.encode(a))
  end
end
