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
    @completed_tasks = []
    @today_completed_tasks = []

    @completed_task_dates = []
    @overdue_task_dates = []
    @upcoming_task_dates= []

    if @journal == nil
      @journal = Journal.new
    end

    if @current_user == nil
      return
    end

    @notes = Note.where(user_id: @current_user.id)

    tasks = Task.where(user_id: @current_user.id)

    tasks.each do |task|
  
      if task.completed != nil
        @completed_tasks << task
        @completed_task_dates << task.deadline.year.to_s + '-' + task.deadline.month.to_s + '-' + task.deadline.day.to_s

        if task.deadline > @today.beginning_of_day && task.deadline < @today.end_of_day
          @today_completed_tasks << task
        end 

        next

      end 

      if task.deadline < Date.today.beginning_of_day
        @overdue_tasks << task
        @overdue_task_dates << task.deadline.year.to_s + '-' + task.deadline.month.to_s + '-' + task.deadline.day.to_s
      elsif task.deadline > Date.today.end_of_day
        @upcoming_tasks << task
        @upcoming_task_dates << task.deadline.year.to_s + '-' + task.deadline.month.to_s + '-' + task.deadline.day.to_s
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

  end

  def update_task_date

    calendar_dates = params[:calendar_date].split('-')

    @today = Date.new(calendar_dates[0].to_i, calendar_dates[1].to_i, calendar_dates[2].to_i)

    @today_tasks = []
    @today_completed_tasks = []

    tasks = Task.where(user_id: @current_user.id)

    tasks.each do |task|
  
      if task.deadline >= @today.beginning_of_day && task.deadline < @today.end_of_day
        if task.completed == nil 
          @today_tasks << task
        else 
          @today_completed_tasks << task
        end
      end

    end

    render partial: "tasks_daily", layout: false

  end

  def update_calendar_month
 
    new_month = params[:calendar_month]

    @today = Date.new(Date.today.year, new_month.to_i, 1)

    @month = @today.strftime("%B")
    @month_start_day = @today.wday
    @days_in_month   = Date.new(@today.year, new_month.to_i, -1).day 

    @completed_task_dates = []
    @overdue_task_dates = []
    @upcoming_task_dates= []

    tasks = Task.where(user_id: @current_user.id)

    tasks.each do |task|
  
      if task.completed != nil
        @completed_task_dates << task.deadline.year.to_s + '-' + task.deadline.month.to_s + '-' + task.deadline.day.to_s
        next
      end 

      if task.deadline < Date.today.beginning_of_day
        @overdue_task_dates << task.deadline.year.to_s + '-' + task.deadline.month.to_s + '-' + task.deadline.day.to_s
      elsif task.deadline > Date.today.end_of_day
        @upcoming_task_dates << task.deadline.year.to_s + '-' + task.deadline.month.to_s + '-' + task.deadline.day.to_s
      end

    end

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

  def create_task

    if @current_user == nil
      head :ok, content_type: "text/html"
      return
    end

    @new_task= Task.new

    @new_task.user_id = @current_user.id

    render partial: "new_task", layout: false

  end

  def update_left_nav
 
    target_page = params[:target_page]

    calendar_date = params[:today_string].split('-')

    @today = Date.new(calendar_date[0].to_i, calendar_date[1].to_i, calendar_date[2].to_i)

    case target_page

    when "left-nav-journal"

      @journal = get_journal(@today.year, @today.month, @today.day)
      
      if @journal == nil
        @journal = Journal.new
      end
   
      render partial: "journal", layout: false

    when "left-nav-notes"
    
      render partial: "notes", layout: false 

    when "left-nav-tasks"

      @upcoming_tasks = []
      @today_tasks = []
      @overdue_tasks = []
      @completed_tasks = []

      tasks = Task.where(user_id: @current_user.id)

      tasks.each do |task|
    
        if task.completed != nil
          @completed_tasks << task

          next

        end 

        if task.deadline < Date.today.beginning_of_day
          @overdue_tasks << task
        elsif task.deadline > Date.today.end_of_day
          @upcoming_tasks << task
        else
          @today_tasks << task
        end

      end      

      render partial: "tasks_summary", layout: false

    when "left-nav-goals"

      @notes = Note.where(user_id: @current_user.id)

      render partial: "longterm_notes", layout: false

    end

    return

  end

  def update_right_nav

    target_page = params[:target_page]

    calendar_date = params[:today_string].split('-')

    @today = Date.new(calendar_date[0].to_i, calendar_date[1].to_i, calendar_date[2].to_i)

    case target_page

    when "right-nav-journal"

      @journal = get_journal(@today.year, @today.month, @today.day)
      
      if @journal == nil
        @journal = Journal.new
      end
   
      render partial: "journal", layout: false

    when "right-nav-notes"
    
      render partial: "notes", layout: false 

    when "right-nav-tasks"

      @upcoming_tasks = []
      @today_tasks = []
      @overdue_tasks = []
      @completed_tasks = []

      tasks = Task.where(user_id: @current_user.id)

      tasks.each do |task|
    
        if task.completed != nil
          @completed_tasks << task

          next

        end 

        if task.deadline < Date.today.beginning_of_day
          @overdue_tasks << task
        elsif task.deadline > Date.today.end_of_day
          @upcoming_tasks << task
        else
          @today_tasks << task
        end

      end      

      render partial: "tasks_summary", layout: false

    when "right-nav-goals"

      @notes = Note.where(user_id: @current_user.id)

      render partial: "longterm_notes", layout: false

    end

    return

  end

end
