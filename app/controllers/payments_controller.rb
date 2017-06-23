class PaymentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    if user_signed_in?
      @user = current_user
    else 
      @user = User.new(id:29) #temporary user assignment
    end
    
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
              flash[:notice] = "Thank you for purchasing #{@product.name}"            
        end
      rescue Stripe::CardError => e
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
    end
    redirect_to products_path
  end

end
