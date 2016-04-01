class NotificationMailer < ApplicationMailer
  def reservation_send_notification(transaction)
    @customer = transaction.customer
    @qr = transaction.reservation.generate_qr
    mail(to: @customer.email, subject: 'GalaxyGrage Reservation')
  end
end
