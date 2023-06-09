class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update destroy]

  def index
    @table = Table.where(restaurant_id: params[:restaurant_id])
    @reservations = Reservation.where(table_id: @table)
    render json: @reservations
  end

  def show
    render json: @reservation
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      render json: { messagge: 'Reservation was successfully created.' }, stauts: 200
    else
      render json: { error: @reservation.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @reservation
      @reservation.update(reservation_params)
      render json: { messagge: 'Reservation was successfully updated.' }, stauts: 200
    else
      render error: { error: 'Unable to update Reservation.' }, status: 400
    end
  end

  def destroy
    if @reservation
      @reservation.destroy
      render json: { messagge: 'Reservation was successfully deleted.' }, stauts: 200
    else
      render error: { error: 'Unable to delete Reservation.' }, status: 400
    end
  end

  private

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:party_size, :booking_day, :user_id, :table_id)
  end
end
