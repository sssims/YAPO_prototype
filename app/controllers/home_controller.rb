require 'date'

class HomeController < ApplicationController

  def index

    today = Date.today

    @month = today.strftime("%B")
    @month_start_day = Date.new(today.year, today.month, 1).wday
    @days_in_month   = Date.new(today.year, today.month, -1).day 
    

  end

end
