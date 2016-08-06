class Note < ActiveRecord::Base

  #after_initialize do 
  #  if self.new_record?
      # Default value for Notes here. DO NOT USE. BUGGY. If attribute is set inside of .new(...) it will be overwritten here. 
  #    self.note_type = NotesHelper::NOTETYPE_DEFAULT
  #  end
  #end

end
