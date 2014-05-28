class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.all
  end

  def show
    @task = Task.new
    @todos = @schedule.todos.rank(:position)
  end
  
  def tomorrow
    @schedule = Schedule.find(params[:schedule_id])
    @schedule = get_tomorrow( @schedule)
    redirect_to schedule_path( @schedule.id )
  end
  
  def yesterday
    @schedule = Schedule.find(params[:schedule_id])
    @schedule = get_yesterday( @schedule)
    redirect_to schedule_path( @schedule.id )
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Schedule was successfully created.' }
        format.json { render :show, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedules/1
  # PATCH/PUT /schedules/1.json
  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end
  
    def get_tomorrow( curdate )
      Time.zone = "Pacific Time (US & Canada)"
      tomorrow =  curdate.today + 1
      schedule = Schedule.where("user_id = ? and today = ?", current_user.id, tomorrow.to_s).first_or_create do |newday|
        newday.today = tomorrow;
        newday.user_id = current_user.id;
      end
      if schedule != nil && schedule.id != nil
        @schedule = Schedule.find(schedule.id) || current_user.create_schedule(:today => tomorrow.to_s)
      else
        @schedule = Schedule.new
        @schedule.today = tomorrow;
        @schedule.user_id = current_user.id;
        @schedule.save
      end     
    end
  
    def get_yesterday( curdate )
      Time.zone = "Pacific Time (US & Canada)"
      yesterday =  curdate.today - 1
      schedule = Schedule.where("user_id = ? and today = ?", current_user.id, yesterday.to_s).first_or_create do |newday|
        newday.today = yesterday;
        newday.user_id = current_user.id;
      end
      if schedule != nil && schedule.id != nil
        @schedule = Schedule.find(schedule.id) || current_user.create_schedule(:today => yesterday.to_s)
      else
        @schedule = Schedule.New
        @schedule.today = yesterday;
        @schedule.user_id = current_user.id;
        @schedule.save
      end     
    end
  

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_params
      params.require(:schedule).permit(:today, :user_id)
    end
end
