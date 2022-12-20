class EdSubjectController < ApplicationController
  before_action :require_user_logged_in!
  before_action :require_user_admin!

  def edit
    @free_prep = []
    Teach.all.each do |pre|
      if pre.predmet.nil?
        r = pre.user.name, pre.id
        @free_prep.push(r)
      end
    end
  end

  def created
    pr = params[:prepodovat]
    if Predmet.find_by(name: params[:subj]).nil? && pr != '' && !params[:fr_pe].select { |_x, y| y == pr }.nil?
      n_pred = Predmet.create(teach_id: pr, name: params[:subj])
      jcreate(n_pred.id)
      # Schedule.create(predmet_id: n_pred.id, time: params[:time], day: params[:day])
      redirect_to administration_path, notice: "#{t('.notice')} #{params[:subj]} "
    else
      redirect_to ed_subject_edit_path, alert: "#{t('.alert')}"
    end
  end

  def delsub
    pred_all = Predmet.all
    @pred_names = []
    pred_all.each do |al|
      @pred_names.push(al.name)
    end
    @day_list = Schedule.days
  end

  def new
    unless Predmet.find_by(name: params[:name]).nil?
      if params[:commit] == 'Create' || params[:commit] == 'Создать'
        if params[:name] != '' && params[:time] != '' && params[:day] != '' && Schedule.find_by(day: params[:day], time: params[:time]).nil?
          Schedule.create(predmet_id: Predmet.find_by(name: params[:name]).id, time: params[:time], day: params[:day].to_i)
          redirect_to administration_path, notice: "#{t('.notice')} #{params[:subj]} "
        else
          redirect_to ed_sub_ed_path, alert: "#{t('.alert')}"
        end
      elsif params[:commit] == 'Delete' || params[:commit] == 'Удалить'
        dele
      elsif params[:commit] == 'DELETE POLNOSIU SUBJECT' || params[:commit] == 'ПОЛНОСТЬЮ УДАЛИТЬ ПРЕДМЕТ'
        dele_all
      end
    else
      redirect_to ed_sub_ed_path, alert: "#{t('.alert')}"
    end
  end

  private

  def dele
    pred_id = Predmet.find_by(name: params[:name]).id
    if params[:name] != '' && params[:time] != '' && params[:day] != '' && !Schedule.find_by(predmet_id: pred_id, time: params[:time], day: params[:day]).nil?
      Schedule.find_by(predmet_id: pred_id, time: params[:time], day: params[:day]).destroy unless Schedule.find_by(predmet_id: pred_id).nil?
      # List.where(predmet_id: pred_id).destroy_all unless List.find_by(predmet_id: user.teach.first.predmet.id).nil?
      # Predmet.find_by(teach_id: user.teach.first.id).destroy
      redirect_to administration_path, notice: "#{t('.notice2')} #{params[:subj]} "
    else
      redirect_to ed_sub_ed_path, alert: "#{t('.alert')}"
    end
  end

  def dele_all
    pred_id = Predmet.find_by(name: params[:name]).id
    if params[:name] != ''
      Schedule.where(predmet_id: pred_id).destroy_all unless Schedule.find_by(predmet_id: pred_id).nil?
      List.where(predmet_id: pred_id).destroy_all unless List.find_by(predmet_id: pred_id).nil?
      Predmet.find_by(id: pred_id).destroy
      redirect_to administration_path, notice: "#{t('.notice2')} #{params[:subj]} "
    else
      redirect_to ed_sub_ed_path, alert: "#{t('.alert')}"
    end
  end

  def jcreate(p_id)
    a = []
    6.times do
      a.push('')
    end
    Stud.all.each do |qr|
      List.create(spisok: ActiveSupport::JSON.encode(a), predmet_id: p_id, stud_id: qr.id)
    end
  end
end
