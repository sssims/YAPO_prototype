class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.integer	:user_id

      t.text	:title
      t.text	:description
      t.text	:tags

      t.datetime :deadline
      t.datetime :completed

      t.timestamps null: false

    end
  end
end
