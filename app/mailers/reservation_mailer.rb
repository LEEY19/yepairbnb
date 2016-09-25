class ReservationMailer < ApplicationMailer
  def booking_emailhost(customer, host, reservation_id)
    @customer = customer
    @reservation_id = reservation_id
    @host = host
    byebug
    mail(to: host.email, subject: 'You have received a new reservation!')
  end

  # def booking_emailcustomer(customer, host, reservation_id, start_date, end_date)
  #   @customer = customer
  #   @reservation_id = reservation_id
  #   @host = host
  #   @start_date = start_date
  #   @end_date = end_date

  #   mail(to: customer.email, subject: "Your reservation has been received, and is awaiting the host's confirmation.")
  # end

end
