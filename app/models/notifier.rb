class Notifier < ActionMailer::Base
  
  def lead_email(agent, leads, subject, body)
    recipients leads
    from       agent
    subject    subject
    body       body
  end

end
