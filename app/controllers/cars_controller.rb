class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_car, only: [:show]
  before_action :set_user


  def index
    if params[:query].present?
      sql_query = "cars.title @@ :query \
      OR cars.address @@ :query \
      OR cars.car_type @@ :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
    @markers = @cars.geocoded.map do |car|
      {
        lat: car.latitude + rand(0..1),
        lng: car.longitude + rand(0..1),
        info_window: render_to_string(partial: "info_window", locals: {car: car})
      }
    end
  end

  def show
    @booking = Booking.new
    @marker_car = Car.where(id: @car.id)
    @markers = @marker_car.geocoded.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        info_window: render_to_string(partial: "info_window", locals: {car: car})
      }
    end
  end


  private

  def set_car
    @car = Car.find(params[:id])
  end

  def set_user
    @user = current_user if user_signed_in?
  end

end
