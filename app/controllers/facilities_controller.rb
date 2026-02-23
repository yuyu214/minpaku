class FacilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_facility, only: [:show, :edit, :update, :destroy]

  def index
    @facilities = Facility.all.order(created_at: :desc)
  end

  def show
    # 施設の最初の部屋にリダイレクト
    first_room = @facility.rooms.first
    if first_room
      redirect_to room_path(first_room)
    else
      redirect_to facilities_path, alert: "この施設には部屋がありません"
    end
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = current_user.facilities.build(facility_params)

    if @facility.save
      room = @facility.rooms.create(
        name: @facility.name,
        description: @facility.description.presence || "自動作成された部屋",
        price: @facility.price || 0,
        user_id: current_user.id
      )

      unless room.persisted?
        Rails.logger.error "Room作成失敗: #{room.errors.full_messages.join(', ')}"
      end

      redirect_to facility_path(@facility), notice: "施設とRoomを登録しました"
    else
      render :new
    end
  end

  # =========================
  # ここから追加
  # =========================

  def edit
  end

  def update
    if @facility.update(facility_params)
      redirect_to facilities_path, notice: "施設を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @facility.destroy
    redirect_to facilities_path, notice: "施設を削除しました"
  end

  private

  def set_facility
    @facility = Facility.find(params[:id])
  end

  def facility_params
    params.require(:facility).permit(:name, :description, :price, :address, :image)
  end
end
