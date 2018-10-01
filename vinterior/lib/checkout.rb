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

require 'product'

# makes shopping baskets
class Checkout
  attr_reader :basket

  def initialize(promotional_rules = {})
    @promotional_rules = promotional_rules
    @basket = []
    @total_price = 0
  end

  def scan(product)
    @basket.push(product)
  end

  def empty
    @basket.clear
    @total_price = 0
  end

  def total
    return 'Your basket is empty!' if @basket.empty?
    @basket.each { |product| @total_price += product.price }
    check_for_promotional_rules
    @total_price.round.to_s.insert(-3, '.').prepend('£')
  end

  def check_for_promotional_rules
    @promotional_rules.each { |rule, active| send(rule) if active }
  end

  # promotional rules
  def multiple_very_cheap_chairs
    chairs = @basket.count { |product| product.product_code == '001' }
    return false unless chairs >= 2
    @total_price -= (chairs * 925)
    @total_price += (chairs * 850)
  end

  def spend_over_sixty
    @total_price *= 0.9 if @total_price > 6000
  end
end
