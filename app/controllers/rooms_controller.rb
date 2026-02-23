class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.includes(:facility).all
  end

  def search
    @rooms = Room.joins(:facility)

    if params[:area].present?
      @rooms = @rooms.where("facilities.address LIKE ?", "%#{params[:area]}%")
    end

    if params[:keyword].present?
      keyword = "%#{params[:keyword]}%"
      @rooms = @rooms.where("facilities.address LIKE ?", keyword)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to @room, notice: "更新しました"
    else
      render :edit
    end
  end

 def destroy
  @room = Room.find(params[:id])
  @room.destroy
  redirect_to search_rooms_path, notice: "施設を削除しました"
end


  private

  def set_room
    @room = Room.find(params[:id])
  end

  def room_params
    params.require(:room).permit(:name, :description, :price, :image)
  end
end
