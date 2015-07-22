class TasksController < ApplicationController

  def index
    list = List.find(params[:list_id])
    @tasks = list.tasks
  end

  def new
    @list = List.find(params[:list_id])
    @task = Task.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = Task.new(task_permitted_params.merge(list: @list))
    @task.save
  end

  def destroy
   @task = Task.find(params[:id])
   @task.destroy
   @list = List.find(params[:list_id])
  end

  def edit
    @task = Task.find(params["id"])
  end


  def update
    @task =Task.find(params["id"])
    @list.update(task_permitted_params)
    redirect_to tasks_path
  end

  private

  def task_permitted_params
    params.require(:task).permit(:name, :done)
  end

end
