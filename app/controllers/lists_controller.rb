class ListsController < ApplicationController

  def index
  end

  def show
    @lists = List.all
  end

  def new
  end

end
