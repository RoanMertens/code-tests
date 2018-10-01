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
  attr_reader :basket

  PRODUCTS = { '001' => ['Very Cheap Chair', 925],
               '002' => ['Little table', 4500],
               '003' => ['Funky light', 1995] }

  def initialize(promotional_rules = {})
    @promotional_rules = promotional_rules
    @basket = []
    @final_price = 0
  end

  def scan(item)
    @basket.push(item)
    @final_price += PRODUCTS[item][1]
  end

  def empty
    @basket.clear
    @final_price = 0
  end

  def check_for_promotional_rules
    @promotional_rules.each do |rule, active|
      send(rule) if active
    end
  end

  def multiple_very_cheap_chairs
    amount_vcc = @basket.count('001')
    if amount_vcc >= 2
      @final_price -= amount_vcc * PRODUCTS['001'][1]
      @final_price += (amount_vcc * 850)
    end
  end

  def spend_over_sixty
    @final_price *= 0.9 if @final_price > 6000
  end

  def total
    return 'Your basket is empty!' if @basket.empty?
    check_for_promotional_rules
    @final_price.round.to_s.insert(-3, '.').prepend('£')
  end
end

# a = Checkout.new(multiple_very_cheap_chairs: true)
# a.scan('001')
# a.scan('001')
# p a.total

# @basket.each do |product|
#   @final_price += PRODUCTS[product][1]
# end

# class Item
#   def initialize(attributes = {})
#     @product_code = attributes.product_code
#     @name = attributes.name
#     @price = attributes.price
#   end

#   def
# end
