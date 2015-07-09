class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params["id"])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_permitted_params)
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
    @list.update(list_permitted_params)
    redirect_to lists_path
  end

  private

  def list_permitted_params
    params.require(:list).permit(:name, :tipo)
  end
end
