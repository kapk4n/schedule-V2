class ScheduleController < ApplicationController
  def bmstu_schedule
    @week_days = Schedule.days
  end

  def new
    @pred = Schedule.where("day = ?", params[:day])
  end
end
