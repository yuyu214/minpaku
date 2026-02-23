class FavoritesController < ApplicationController
  before_action :authenticate_user!

def index
    @favorite_rooms = current_user.favorite_rooms
  end


  def create
    room = Room.find(params[:room_id])
    current_user.favorites.create(room: room)
    redirect_back fallback_location: root_path
  end

  def destroy
    room = Room.find(params[:room_id])
    current_user.favorites.find_by(room: room)&.destroy
    redirect_back fallback_location: root_path
  end
end
