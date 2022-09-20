class BookingsController < ApplicationController
  before_action :set_car, only: %i[create]



  def create
    @booking = Booking.new(booking_params)
    @booking.car = @car
    @booking.user = current_user
    @booking.total_price = (Date.parse(@booking.end_date) - Date.parse(@booking.start_date)).to_i * @car.price_per_day
    if @booking.save!
      redirect_to profile_path
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to profile_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :user_id, :car_id)
  end

  def set_car
    @car = Car.find(params[:car_id])
  end




end
