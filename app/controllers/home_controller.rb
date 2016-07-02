require 'date'

class HomeController < ApplicationController

  def index

    @today = Date.today

    @month = @today.strftime("%B")
    @month_start_day = Date.new(@today.year, @today.month, 1).wday
    @days_in_month   = Date.new(@today.year, @today.month, -1).day 

    @journal = get_journal(@today.year, @today.month, @today.day)

    if @journal == nil
      @journal = Journal.new
    end

    if @current_user == nil
      return
    end

    @notes = Note.where(user_id: @current_user.id)

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

end
