
class UserMailer < ApplicationMailer
  default from: "berlinbike@example.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'reykuizon83@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def welcome(user)
    @user = user
    mail(:to => user.email,
         :subject => "Welcome to Berlin Bikes!")
  end

  def thanks(user, product)
    @user = user
    @product = product
    mail(:to => user.email,
        :subject => "Thank you for purchasing #{@product.name}").deliver_now
  end

end

