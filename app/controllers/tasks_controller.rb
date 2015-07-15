class TasksController < ApplicationController

  def create
    list = List.find(params[:list_id])
    redirect_to list_path(list)
  end

  def destroy
   list = List.find(params[:list_id])
   task = Task.find(params[:id])
   task.destroy
   redirect_to list_path(list)
  end


end
