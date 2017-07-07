class PaymentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    if user_signed_in?
      @user = current_user
      token = params[:stripeToken]
      # Create the charge on Stripe's servers - this will charge the user's car
      begin
        charge = Stripe::Charge.create(
          amount: (@product.price * 100).to_i , # amount in cents, again
          currency: "usd",
          source: token,
          description: @product.name,
          receipt_email: params[:stripeEmail]
        )
        if charge.paid
            Order.create(
              product_id: @product.id,
              user_id: @user.id, 
              total: @product.price )
              UserMailer.successful_payment(@user, @product).deliver_now
              flash[:notice] = "Thank you for purchasing #{@product.name}"            
        end
      rescue Stripe::CardError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
       end
      redirect_to @product
    else 
      # @user = User.new(id:29) #Guest User 
      flash[:alert] = "Please Login to complete the transaction"
      redirect_to new_user_session_path
    end
  
  end
    
end
