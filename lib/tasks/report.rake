namespace :report do
  task send_email: :environment do
    NotificationMailer.plannedvsactual.deliver_now
  end

end
