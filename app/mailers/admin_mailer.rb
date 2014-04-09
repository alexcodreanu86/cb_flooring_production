class AdminMailer < ActionMailer::Base
  default from: ENV["EMAIL_ADDRESS"]

  def new_quote_request(quote_request)
    @has_message = !quote_request.message.empty?
    @quote = quote_request
    
    mail(to: ENV["ADMIN_EMAIL"], subject: "New quote request") do |format|
                format.html
    end
  end

end