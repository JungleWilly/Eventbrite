class FindCustomer
  require "stripe"
  Stripe.api_key = "sk_test_atvr4v77QeOVCRIOIb9SbJ5U"

  def perform
    Stripe::Customer.retrieve("cus_EWcT8jTXmziqqH")
  end
end