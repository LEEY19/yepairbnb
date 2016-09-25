class ReservationsController < ApplicationController
  before_action :find_reservation, except: [:new, :create]


  def new
  end

  def show

  end

  def create
    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.new(start: Date.parse(reservation_params[:start]), end: Date.parse(reservation_params[:end]))
    if @reservation.save
      @reservation.update(user_id: current_user.id)
      ReservationMailer.booking_email(@reservation.user, @listing.user, @reservation.id).deliver_now
      redirect_to @listing, notice: "Your booking is made!"
    else
      render 'new'
    end
  end

  # def update
  #   if @listing.update(listing_params)
  #     redirect_to @listing, notice: "Your listing is edited!"
  #   else
  #     render 'edit'
  #   end
  # end


  private

  def reservation_params
    params.require(:reservation).permit(:start, :end)
  end

  def find_reservation
    @reservation = Reservation.find(params[:id])
  end
end
