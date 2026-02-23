class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reservations = current_user.reservations
                                .includes(:room)
                                .order(created_at: :desc)
  end

  def new
    @room = Room.find(params[:room_id])
    @facility = @room.facility
    @reservation = Reservation.new
  end

  def confirm
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(params[:reservation][:room_id])
  end

  def create
    @reservation = current_user.reservations.build(reservation_params)
    @room = Room.find(@reservation.room_id)

    if @reservation.save
      redirect_to reservations_path, notice: "予約完了しました"
    else
      render :new
    end
  end

  def show
    @reservation = current_user.reservations.find(params[:id])
  end

  def destroy
    reservation = current_user.reservations.find(params[:id])
    reservation.destroy
    redirect_to reservations_path, notice: "予約をキャンセルしました"
  end

  private

  def reservation_params
    params.require(:reservation)
          .permit(:room_id, :check_in, :check_out, :people)
  end
end
