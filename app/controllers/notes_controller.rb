class NotesController < ApplicationController

  def create

    new_note = params[:note]

    new_note.save

    head :ok

  end 

end
