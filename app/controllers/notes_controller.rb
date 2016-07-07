class NotesController < ApplicationController

  def create

    note_params = params[:note]

    new_note = Note.new(user_id: session[:user_id], note_type: NotesHelper::NOTETYPE_LONGTRM, title: note_params[:title], content: note_params[:content], tags: "")
     
    new_note.save

    redirect_to :controller => 'home', :action => 'index'

  end 

end
