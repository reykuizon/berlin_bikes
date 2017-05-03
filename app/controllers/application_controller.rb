class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def thank_you
  @name = params[:name]
  @email = params[:email]
  @message = params[:message]
  ActionMailer::Base.mail(:from => @email,
      :to => 'reykuizon83@gmail.com',
      :subject => "A new contact form message from #{@name}",
      :body => @message).deliver
  end

end
