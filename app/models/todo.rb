class Todo < ActiveRecord::Base
  
  include RankedModel
  
  belongs_to :schedule_block
  belongs_to :task
  
  ranks :position, :with_same => :schedule_block_id
  
  validates_uniqueness_of :task_id, :uniqueness => { :on => :create, 
    :message => "Cannot add the same task twice", :scope => "schedule_block_id"}

  before_save :default_values
  def default_values
    self.position ||= 0
  end
  
end
