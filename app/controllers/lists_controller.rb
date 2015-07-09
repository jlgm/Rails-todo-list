class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @lists = List.all
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

  private

  def list_permitted_params
    params.require(:list).permit(:name, :tipo)
  end
end
