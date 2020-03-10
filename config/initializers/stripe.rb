Rails.configuration.stripe = {
  publishable_key: ENV['pk_test_q9EvOiXATYUQf5VX68ywHS8Z00bTjydGWs'],
  secret_key:      ENV['sk_test_lzmaKkHVPZxcebnnZ0n3gIO0008ox3GYKo']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
