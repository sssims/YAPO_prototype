class JournalsController < ApplicationController

  def create_or_update 

    if @current_user == nil
      # ERR
      redirect_to :controller => 'home', :action => 'index'
      return
    end

    #existing_journal = Journal.where(user_id: session[:user_id], year: params[:year], month: params[:month], day: params[:day]).first

    curr_j = params[:journal]

    current_entry = Journal.where(user_id: session[:user_id], year: curr_j[:year], month: curr_j[:month], day: curr_j[:day]).first || Journal.new(user_id: session[:user_id], year: curr_j[:year], month: curr_j[:month], day: curr_j[:day])

    current_entry.title = curr_j[:title]
    current_entry.content = curr_j[:content] 
  
    current_entry.save

    redirect_to :controller => 'home', :action => 'index'
  end

end
