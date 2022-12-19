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
    if Predmet.find_by(name: params[:subj]).nil? && pr != '' && !params[:fr_pe].select { |_x, y| y == pr }.nil? && !params[:time].nil? && !params[:day].nil?
      n_pred = Predmet.create(teach_id: pr, name: params[:subj])
      jcreate(n_pred.id)
      Schedule.create(predmet_id: n_pred.id, time: params[:time], day: params[:day])
      redirect_to administration_path, notice: "Subject #{params[:subj]} sucssessfylly created"
    else
      redirect_to ed_subject_edit_path, alert: 'Invalid name of Subject or Teacher'
    end
  end

  private

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
