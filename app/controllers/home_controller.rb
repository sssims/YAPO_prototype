require 'date'

class HomeController < ApplicationController

  def index

    today = Date.today

    @month = today.strftime("%B")
    @month_start_day = Date.new(today.year, today.month, 1).wday
    @days_in_month   = Date.new(today.year, today.month, -1).day 

    #Journal.new(title: 'Good day', tags: '{}', content: 'Today was great. I had such a great time', user_id: 3, year: today.year, month: today.month, day: today.day).save

    @journal = get_journal(today.year, today.month, today.day)

  end

  def get_journal(year, month, day)

    date_string = year

    if @current_user
      return Journal.where(user_id: @current_user.id, year: year, month: month, day: day).first #should only by one
    else
      return nil
    end

  end

  def update_journal
  
    
  
  end

end
