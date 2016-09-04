class NotesController < ApplicationController

  def create

    note_params = params[:note]

    new_note = Note.new(user_id: session[:user_id], note_type: NotesHelper::NOTETYPE_DEFAULT, title: note_params[:title], content: note_params[:content], tags: "")
     
    new_note.save

    redirect_to :controller => 'home', :action => 'index'

  end

  def create_longterm

    note_params = params[:note]

    new_note = Note.new(user_id: session[:user_id], note_type: NotesHelper::NOTETYPE_LONGTRM, title: note_params[:title], content: note_params[:content], tags: "")
     
    new_note.save

    redirect_to :controller => 'home', :action => 'index'

  end 

  def longterm_index

    @notes = Note.where(user_id: session[:user_id], note_type: NotesHelper::NOTETYPE_LONGTRM)

  end

  def index

    @notes = Note.where(user_id: session[:user_id], note_type: NotesHelper::NOTETYPE_DEFAULT)

  end

  def show

    @note = Note.find(params[:id])

  end

  def update

    curr_n = params[:note]

    update_record = Note.find(curr_n[:id].to_i)

    if update_record != nil
 
      update_record.content = curr_n[:content]
      update_record.title = curr_n[:title]

      update_record.save
 
    end

    redirect_to :action => 'show', :id => curr_n[:id]

  end

  def destroy

    @note = Note.delete(params[:id])

    redirect_to :controller => 'home', :action => 'index'

  end

  def notebook_destroy

    binding.pry

    redirect_to :controller => 'notes', :action => 'notebook'

  end

  def complete
 
    @note = Note.find(params[:id])

  end

  def notebook

    @note = nil

    show_id = params[:id]

    if !show_id.nil?
      @note = Note.find(show_id)
    end

    @notes = Note.where(user_id: session[:user_id])

  end

  def notebook_show
    
    @note = Note.find(params[:note_id])

    render partial: "notebook_note_show", layout: false

  end 

  def notebook_update

    note = params[:note]

    if note[:id].is_a? Numeric
 
      note_record = Note.find(note[:id])

    else

      note_record = Note.new(user_id: session[:user_id], note_type: NotesHelper::NOTETYPE_DEFAULT, :title => note[:title], :content => note[:content])
 
    end

    note_record.content = note[:content]
    note_record.title = note[:title]

    note_record.save
 
    redirect_to :controller => 'notes', :action => 'notebook', :id => note_record.id

  end 

  def notebook_new

    @note = Note.new(user_id: session[:user_id], note_type: NotesHelper::NOTETYPE_DEFAULT)

    render partial: "notebook_note_show", layout: false

  end

end
