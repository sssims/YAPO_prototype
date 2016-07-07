class TasksController < ApplicationController

  def index

    @tasks = Task.where(user_id: session[:user_id])

    if @tasks == nil
      @tasks = []
    end

  end

  def create
  
    task_params = params[:task]
 
    deadline = Date.new(task_params["deadline(1i)"].to_i, task_params["deadline(2i)"].to_i, task_params["deadline(3i)"].to_i)

    new_task = Task.new(user_id: session[:user_id], title: task_params[:title], description: task_params[:description], tags: "", deadline: deadline)

    new_task.save

    redirect_to :controller => 'home', :action => 'index'

  end

  def mark_complete

    completed_task = Task.find(params[:note_id])
    completed_task.completed = DateTime.now
    completed_task.save
 
    head :ok

  end

end
