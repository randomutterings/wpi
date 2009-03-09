class Notifier < ActionMailer::Base
  
  def lead_email(agent, leads, subject, body, files=[])
    recipients leads
    from       agent
    subject    subject
    body       body
    files.each do |file|  
      attachment "application/pdf" do |a|  
        a.body = File.read(RAILS_ROOT + file)
      end
    end
  end

end
