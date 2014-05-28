class HomeController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_schedule
  
  def index
    @task = Task.new
    @schedule_blocks = find_blocks( @today )
  end
  
  protected
    def find_schedule()
      Time.zone = "Pacific Time (US & Canada)"

      date = Date.current.to_s   
      @today = current_user.schedule.where( "today = ?", date).first_or_create do |newday|
        newday.today = date
        newday.user_id = current_user.id;
      end  
    end
  
    def find_blocks( schedule )
      @blocks = schedule.schedule_blocks.where( "schedule_id = ?", schedule.id)
      if !@blocks.first
        if !current_user.time_blocks.first
          @tblock = current_user.time_blocks.create
          @tblock.name = 'End of day'
          @tblock.save
        end
        
        @timeblocks = current_user.time_blocks.each do |time| 
          puts('####' + time.name)
          @block = schedule.schedule_blocks.create
          @block.time_block_id = time.id
          @block.completed = false
          @block.save
          @blocks = schedule.schedule_blocks.where( "schedule_id = ?", schedule.id)
        end
      end
      return @blocks
    end
  
end


