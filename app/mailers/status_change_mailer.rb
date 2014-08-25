class StatusChangeMailer < ActionMailer::Base
  default from: "townbikesapp@gmail.com"

  def status_change_mail(renter, reservation)
    @renter = renter
    @reservation = reservation
    @url  = "http://localhost:3000.com/reservations/#{reservation.id}"
    mail(:to => renter.email, :subject => "The status of your reservation has changed")
  end
end
