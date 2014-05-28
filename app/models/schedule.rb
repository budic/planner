class Schedule < ActiveRecord::Base
  belongs_to :user
  has_many :todos
  has_many :tasks, :through => :todos
end
