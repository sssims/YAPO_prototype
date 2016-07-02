class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|

      t.integer	:user_id
 
      t.integer	:type
      t.text	:title
      t.text	:content
      t.text	:tags

      t.timestamps null: false

    end
  end
end
