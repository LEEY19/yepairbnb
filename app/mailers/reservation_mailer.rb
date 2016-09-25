class ReservationMailer < ApplicationMailer
  def booking_emailhost(customer, host, reservation_id)
    @customer = customer
    @reservation_id = reservation_id
    @host = host

    mail(to: host.email, subject: 'You have received a new reservation!')
  end

  def booking_emailcustomer(customer, host, reservation_id)
    @customer = customer
    @reservation_id = reservation_id
    @host = host

    mail(to: @customer.email, subject: "Your reservation has been received, and is awaiting the host's confirmation.")
  end

end
