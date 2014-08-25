class NewReservationMailer < ActionMailer::Base
  default from: "townbikesapp@gmail.com"

    def new_reservation_mail(owner, reservation)
      @owner = owner
      @reservation = reservation
      @url  = "http://localhost:3000.com/reservations/#{reservation.id}"
      mail(:to => owner.email, :subject => "The status of your reservation has changed")
    end
end
