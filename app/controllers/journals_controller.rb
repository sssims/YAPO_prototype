class JournalsController < ApplicationController

  def create_or_update 

    if @current_user == nil
      # ERR
      redirect_to :controller => 'user', :action => 'login'
      return
    end

    #existing_journal = Journal.where(user_id: session[:user_id], year: params[:year], month: params[:month], day: params[:day]).first

    curr_j = params[:journal]

    current_entry = Journal.where(user_id: session[:user_id], year: curr_j[:year], month: curr_j[:month], day: curr_j[:day]).first || Journal.new(user_id: session[:user_id], year: curr_j[:year], month: curr_j[:month], day: curr_j[:day])

    current_entry.title = curr_j[:title]
    current_entry.content = curr_j[:content] 
  
    if !current_entry.save
      #ERR - wits the deel?
    end
  
    redirect_to :controller => 'home', :action => 'index'

  end

  def show

    if params[:id] != nil
      @journal = Journal.find(params[:id]) 
    else
      @journal = Journal.new
      @journal.year = params[:year]
      @journal.month = params[:month]
      @journal.day = params[:day]
    end

  end

  def notebook

    journals = Journal.where(user_id: session[:user_id]).order(:created_at).limit(10)

    @journals_left = Array.new
    @journals_right = Array.new

    @total_length = 0

    journals.each do |j|

      if @total_length < 720
         @journals_left.push(j)
      elsif @total_length < 1440
         @journals_right.push(j)
      end

      @total_length = @total_length + j.content.length

    end

    if params[:id] != nil
      @current_journal = Journal.find(params[:id]) 
    else
      @current_journal = Journal.new
      @current_journal.year = params[:year]
      @current_journal.month = params[:month]
      @current_journal.day = params[:day]
    end


  end

end
