class TasksController < ApplicationController
  def index
    @task =Task.new
    @tasks = Task.where( 'user_id' => current_user.id )
  end
  
  def show
    @task = Task.find params[:id]
  end
  
  def create
    @task = Task.new task_params
    @task.save
    @todo = Todo.new
    @todo.task_id = @task.id
    @todo.schedule_id = params[:schedule_id]
    @todo.save
    redirect_to :back
  end

  def edit
    @task = Task.find params[:id]
  end
  
  def update
    task = Task.find params[:id]
    if task.update_attributes task_params
      redirect_to root_path, :notice => 'Your task has successfully been updated.'
    else
      redirect_to root_path, :notice => 'There was an error updating your task.'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @todo = Todo.find( @task.todo.id )
    @todo.destroy
    @task.destroy 
    redirect_to root_path, :notice => 'Task has been deleted'
  end
  
  def set_complete
    @task = Task.find(params[:task_id])
    @task.state = :complete
    @task.save
    respond_to do |format|    
      format.js  
    end    
  end 
  
  def set_ready
    @task = Task.find(params[:task_id])
    @task.state = :ready
    @task.save
    respond_to do |format|    
      format.js  
    end    
  end 
  
  private 
  
  def task_params
    params.require(:task).permit(:task)
  end
  
end
