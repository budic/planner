class TimeBlock < ActiveRecord::Base
  belongs_to :user
  has_many :schedule_blocks
end
