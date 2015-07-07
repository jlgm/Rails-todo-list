class ListsController < ApplicationController

  def index
  end

  def show
    @lists = List.all
  end

  def new
    lista = List.new
    lista.name = params[:name]
    lista.tipo = params[:tipo]
    lista.save
  end

end
