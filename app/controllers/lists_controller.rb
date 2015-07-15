class ListsController < ApplicationController

  before_action :authorize_user, except: [:index, :create, :new]

  def authorize_user
    @list = List.find(params[:id])
    action = params[:action]

    if action == "show"
      if @list.tipo != "publica"
        redirect_to lists_path
      end
    elsif @list.user != current_user
      redirect_to lists_path
    end
  end

  def index
    @lists = List.where(["user_id = ? OR tipo = ?", current_user, "publica"])
  end

  def show
    @list = List.find(params["id"])
    @task = Task.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_permitted_params.merge(user: current_user))
    saved = @list.save
      if saved
        redirect_to lists_path
      else
        render :new
      end
  end

  def destroy
    list = List.find(params["id"])
    list.destroy
    redirect_to lists_path
  end

  def edit
    @list = List.find(params["id"])
  end

  def update
    @list =List.find(params["id"])
    @list.update(list_permitted_params)
    redirect_to lists_path
  end

  private

  def list_permitted_params
    params.require(:list).permit(:name, :tipo)
  end
end
