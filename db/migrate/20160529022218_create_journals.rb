class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|

      t.text     :title
      t.string   :tags
      t.text     :content

      t.integer  :user_id
      t.datetime :day
 
      t.timestamps null: false
    end
  end
end
