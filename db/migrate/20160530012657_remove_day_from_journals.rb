class RemoveDayFromJournals < ActiveRecord::Migration
  def change
    remove_column :journals, :day, :datetime
  end
end
