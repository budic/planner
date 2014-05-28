class HomeController < ApplicationController
  before_action :authenticate_user!
  before_filter :find_schedule
  
  def index
    @task = Task.new
    puts('###:' + @today.id.to_s)
    @todos = @today.todos.rank(:position)
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
end


