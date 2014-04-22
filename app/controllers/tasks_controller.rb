class TasksController < ApplicationController
  def index
    @task =Task.new
    @tasks = Task.where( 'user_id' => current_user.id )
  end
  
  def create
    @task = Task.new
    @task = current_user.tasks.create task_params
    redirect_to :back
  end

  def edit
    @task = Task.find params[:id]
  end
  
  def update
    task = Task.find params[:id]
    if task.update_attributes task_params
      redirect_to tasks_path, :notice => 'Your task has successfully been updated.'
    else
      redirect_to :back, :notice => 'There was an error updating your task.'
    end
  end
  
  def destroy
    Task.destroy params[:id]
    redirect_to tasks_path, :notice => 'Task has been deleted'
  end
  
  
  private 
  
  def task_params
    params.require(:task).permit(:task)
  end
  
end
