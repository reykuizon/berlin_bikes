if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_bFgeJZAS8TXz3UB1G4dsuJ5G',
    secret_key: 'sk_test_fIQw3iWXNtq2nRheXQOHyRFf'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]




