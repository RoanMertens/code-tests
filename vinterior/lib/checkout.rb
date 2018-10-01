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

# PRODUCTS = { '001' => ['Very Cheap Chair', 925],
# '002' => ['Little table', 4500],
# '003' => ['Funky light', 1995] }

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

  def calc_price
    @basket.each do |product|
      @total_price += product.price
    end
    check_for_promotional_rules
  end

  def check_for_promotional_rules
    @promotional_rules.each do |rule, active|
      send(rule) if active
    end
  end

  def multiple_very_cheap_chairs
    chairs = @basket.count { |product| product.product_code == '001' }
    return false unless chairs >= 2
    @total_price -= (chairs * 925)
    @total_price += (chairs * 850)
  end

  def spend_over_sixty
    @total_price *= 0.9 if @total_price > 6000
  end

  def total
    return 'Your basket is empty!' if @basket.empty?
    calc_price
    @total_price.round.to_s.insert(-3, '.').prepend('£')
  end
end

# a = Checkout.new(multiple_very_cheap_chairs: true)
# a.scan('001')
# a.scan('001')
# p a.total

# @basket.each do |product|
#   @final_price += PRODUCTS[product][1]
# end
