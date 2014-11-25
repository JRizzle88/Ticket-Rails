class AdminMailer < ActionMailer::Base
  default from: "Progressor"

  def new_ticket(ticket)
    @ticket = ticket
    mail(to: 'jrizzle88888@gmail.com', subject: "New Ticket Submitted")
  end

end
