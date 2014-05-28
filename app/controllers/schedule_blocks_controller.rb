class ScheduleBlocksController < ApplicationController
  before_action :set_schedule_block, only: [:show, :edit, :update, :destroy]

  # GET /schedule_blocks
  # GET /schedule_blocks.json
  def index
    @schedule_blocks = ScheduleBlock.all
  end

  # GET /schedule_blocks/1
  # GET /schedule_blocks/1.json
  def show
  end

  # GET /schedule_blocks/new
  def new
    @schedule_block = ScheduleBlock.new
  end

  # GET /schedule_blocks/1/edit
  def edit
  end

  # POST /schedule_blocks
  # POST /schedule_blocks.json
  def create
    @schedule_block = ScheduleBlock.new(schedule_block_params)

    respond_to do |format|
      if @schedule_block.save
        format.html { redirect_to @schedule_block, notice: 'Schedule block was successfully created.' }
        format.json { render :show, status: :created, location: @schedule_block }
      else
        format.html { render :new }
        format.json { render json: @schedule_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schedule_blocks/1
  # PATCH/PUT /schedule_blocks/1.json
  def update
    respond_to do |format|
      if @schedule_block.update(schedule_block_params)
        format.html { redirect_to @schedule_block, notice: 'Schedule block was successfully updated.' }
        format.json { render :show, status: :ok, location: @schedule_block }
      else
        format.html { render :edit }
        format.json { render json: @schedule_block.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedule_blocks/1
  # DELETE /schedule_blocks/1.json
  def destroy
    @schedule_block.destroy
    respond_to do |format|
      format.html { redirect_to schedule_blocks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_schedule_block
      @schedule_block = ScheduleBlock.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def schedule_block_params
      params[:schedule_block]
    end
end
