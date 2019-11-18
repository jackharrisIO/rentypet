class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    if @booking.save
      redirect_to booking_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to booking_path
    else
      render 'edit'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :status)
  end
end
