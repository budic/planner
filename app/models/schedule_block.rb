class ScheduleBlock < ActiveRecord::Base
  belongs_to :schedule
  belongs_to :time_block
  has_many :todos
end
