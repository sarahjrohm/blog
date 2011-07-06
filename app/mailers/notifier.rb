# app/mailer/notifier.rb
class Notifier < ActionMailer::Base

  def support_notification(sender)
    @sender = sender
    mail(:to => "srohm.alifeofplenty@gmail.com",
         :from => sender.email,
         :subject => "Message from A Life of Plenty")
 end
end
