class ScheduleController < ApplicationController
  def bmstu_schedule
    @week_days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Su" ]
  end

  def new
    @sum = Predmet.where('day = ?', Predmet.days[params[:day]])
  end
end
