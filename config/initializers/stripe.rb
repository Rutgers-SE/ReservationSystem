Rails.configuration.stripe = {
  # :published_key => ENV['PUBLISHED_KEY'],
  # :secret_key => ENV['SECRET_KEY']
  :published_key => 'sk_test_Nee1hSVu4ViJhny9SySDQnKg',
  :secret_key => 'pk_test_nkABjmEhINPYiDKMzCp0z7yS'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
