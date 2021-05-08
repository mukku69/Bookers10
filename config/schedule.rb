require File.expand_path(File.dirname(__FILE__) + "/environment")
rails_env = Rails.env.to_sym
set :environment, rails_env
set :output, 'log/cron.log'
every 2.minute do
  begin
    runner "Batch::SendMail.send_mail"
  rescue => e
    Rails.logger.error("aborted rails runner")
    raise e
  end
end