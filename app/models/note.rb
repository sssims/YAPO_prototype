class Note < ActiveRecord::Base

  after_initialize do 
    if self.new_record?
      # Default value for Notes here
      self.note_type = NotesHelper::NOTETYPE_DEFAULT
    end
  end

end
