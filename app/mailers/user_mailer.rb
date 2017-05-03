class UserMailer < ApplicationMailer
  default from: 'reykuizon83@gmail.com'

  def contact_form(email, name, message)
  @message = message
    mail(:from =>email,
      :to => 'reykuizon83@gmail.com',
      :subject => "A new contact form message from #{name}",
      :body => @message).deliver
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver
  end
end
