class NotesController < ApplicationController

  def create

    note_params = params[:note]

    new_note = Note.new(user_id: session[:user_id], title: note_params[:title], content: note_params[:content], tags: "")
     
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

  def complete
 
    @note = Note.find(params[:id])

  end

end
