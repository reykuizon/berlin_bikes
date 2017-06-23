# class UserMailer < ApplicationMailer
#   default from: 'email@berlinbikeshop.com'

#   def contact_form(email, name, message)
#     @message = message
#     mail(:from =>email,
#       :to => 'reykuizon83@gmail.com',
#       :subject => "A new contact form message from #{name}",
      
#   end

#   # WELCOME EMAIL TO USER
#   def welcome(user)
#     @appname = "Berlin Bike Shop"
#     mail(to: user.email,
#     subject: "Welcome to #{@appname}!")
#   end
  
#   def thank_you
#     @name = params[:name]
#     @email = params[:email]
#     @message = params[:message]
#     UserMailer.contact_form(@email, @name, @message).deliver_now
#   end
  
# end
