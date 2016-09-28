class TransactionsController < ApplicationController
  def new
    gon.client_token = generate_client_token
    @start = params[:start]
    @end = params[:end]
    @listing_id = params[:listing_id]
    @charge = params[:charge]
  end

  def create

    @listing = Listing.find(params[:listing_id])
    @reservation = @listing.reservations.new(user_id: current_user.id, start: Date.parse(params[:start]), end: Date.parse(params[:end]))
    @result = Braintree::Transaction.sale(
              amount: params[:charge],
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      @reservation.save
      # ReservationJob.perform_later(@reservation.user, @listing.user, @reservation.id)
      ReservationMailer.booking_emailcustomer(@reservation.user, @listing.user, @reservation.id).deliver_now
      ReservationMailer.booking_emailhost(@reservation.user, @listing.user, @reservation.id).deliver_now
      redirect_to @listing, notice: "Congraulations! Your payment has been received and booking has been confirmed!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_client_token
      render :new
    end
  end

  private

  def generate_client_token
    Braintree::ClientToken.generate
  end
end
