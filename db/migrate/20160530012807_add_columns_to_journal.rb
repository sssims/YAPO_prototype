class AddColumnsToJournal < ActiveRecord::Migration
  def change
    add_column :journals, :year, :integer
    add_column :journals, :month, :integer
    add_column :journals, :day, :integer
  end
end
