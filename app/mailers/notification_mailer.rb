class NotificationMailer < ApplicationMailer
  default from: "obabot@godeepak.com"

  def plannedvsactual

    @today = Date.today - 3.days
    mail(:to => "rushabh@linkwok.com",:subject => "OBA dashboard report for #{@today.to_s(:short)}")
  end
end
