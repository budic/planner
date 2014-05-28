class Schedule < ActiveRecord::Base
  belongs_to :user
  
  has_many :schedule_blocks
  has_many :todos, :through => :schedule_blocks
  has_many :tasks, :through => :todos
end
