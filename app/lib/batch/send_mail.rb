class Batch::SendMail
  def self.send_mail
    DailyMailer.daily_notification.deliver_now
  end
end