# write test
# write checkout

# As user I can:
# Make a new checkout with the selected promotional_rules.
# Add items to my checkout.
# Show the total price. (with the applied promotional_rules)

# checkout class

# checkout instance
# Calculate the total price.
# Add items in any possible order.
# Add promotional_rules where a new checkout instance is made.

# makes shopping baskets
class Checkout
  def initialize(promotional_rules = {})
    @promotional_rules = promotional_rules
  end

  def total
    'Your basket is empty!'
  end
end
