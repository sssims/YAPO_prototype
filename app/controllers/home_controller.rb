require 'date'

class HomeController < ApplicationController

  def index
 
    @today = Date.today

    @month = @today.strftime("%B")
    @month_start_day = Date.new(@today.year, @today.month, 1).wday
    @days_in_month   = Date.new(@today.year, @today.month, -1).day 

    @journal = get_journal(@today.year, @today.month, @today.day)

    @upcoming_tasks = []
    @today_tasks = []
    @overdue_tasks = []
 
    if @journal == nil
      @journal = Journal.new
    end

    if @current_user == nil
      return
    end

    @notes = Note.where(user_id: @current_user.id)

    tasks = Task.where(user_id: @current_user.id)

    tasks.each do |task|
   
      if task.deadline < Date.today.beginning_of_day
        @overdue_tasks << task
      elsif task.deadline > Date.today.end_of_day
        @upcoming_tasks << task
      else
        @today_tasks << task
      end

    end
  
  end

  def get_journal(year, month, day)

    date_string = year

    if @current_user
      return Journal.where(user_id: @current_user.id, year: year, month: month, day: day).first #should only by one
    else
      return nil
    end

  end

  def update_date

    calendar_dates = params[:calendar_date].split('-')

    @today = Date.new(calendar_dates[0].to_i, calendar_dates[1].to_i, calendar_dates[2].to_i)

    @journal = get_journal(@today.year, @today.month, @today.day)

    if @journal == nil
   
      @journal = Journal.new

    end

    render partial: "journal", layout: false

    #head :ok

  end

  def update_calendar_month
 
    new_month = params[:calendar_month]

    @today = Date.new(Date.today.year, new_month.to_i, 1)

    @month = @today.strftime("%B")
    @month_start_day = @today.wday
    @days_in_month   = Date.new(@today.year, new_month.to_i, -1).day 

    render partial: "calendar", layout: false

  end

  def create_note

    if @current_user == nil
      head :ok, content_type: "text/html"
      return
    end

    @new_longterm_note = Note.new

    @new_longterm_note.note_type = NotesHelper::NOTETYPE_LONGTRM
    @new_longterm_note.user_id = @current_user.id

    render partial: "new_longterm_note", layout: false

  end

end
