class FavoritesController < ApplicationController

  def index
    favorites = Favorite.where("user_id = ?", current_user)
    @lists = []
    favorites.each do |f|
      @lists.append(List.find(f.list_id))
    end
  end

  def create
    #todo: avoid duplicates
    @favorite = Favorite.new({user_id: current_user.id, list_id: params[:list_id]})
    @favorite.save
    redirect_to lists_path
  end

  def destroy
    @favorite = Favorite.where("user_id = ? and list_id = ?", current_user, params[:list_id])
    @favorite.destroy_all
    redirect_to lists_path
  end

end
