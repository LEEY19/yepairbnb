class ReservationMailer < ApplicationMailer
  def booking_email(customer, host, reservation_id)

    @customer = customer
    @reservation_id = reservation_id
    @host = host
    mail(to: host.email, subject: 'You have received a new reservation!')
  end
end
