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
  end

  def scan(item)
    @basket.push(item)
  end

  def empty
    @basket.clear
  end

  def check_for_promotional_rules
    @promotional_rules.each do |rule, active|
      send(rule) if active
    end
  end

  def total
    return 'Your basket is empty!' if @basket.empty?
    price = 0
    @basket.each do |product|
      price += PRODUCTS[product][1]
    end
    price.to_s.insert(-3, '.').prepend('£')
    # "#{}.#{}"
  end
end

# class Item
#   def initialize(attributes = {})
#     @product_code = attributes.product_code
#     @name = attributes.name
#     @price = attributes.price
#   end

#   def
# end
