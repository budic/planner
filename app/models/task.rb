class Task < ActiveRecord::Base
  enum state: [:ready, :complete]
  
  validates :task, presence: true
  
  belongs_to :user
  has_one :todo
  
  before_save :default_values
  def default_values
    self.state ||= :complete
  end
  
end
