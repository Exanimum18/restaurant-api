class ReservationMailer < ApplicationMailer
  def reservation_email(user)
    mail to: user.email, subjec: 'Reservacion', from: "example@gmail.com"
  end
end
