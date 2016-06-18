class Journal < ActiveRecord::Base

  belongs_to :user

  # A user can only have 1 journal for each day
  #validates_uniqueness_of :user_id, :year, :month, :day #Note: doesn't work
  validates :user, uniqueness: { scope: [:user_id, :year, :month, :day] }

end
