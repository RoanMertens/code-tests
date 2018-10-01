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

  PRODUCTS = { '001' => ['Very Cheap Chair', 9.25],
               '002' => ['Little table', 45.00],
               '003' => ['Funky light', 19.95]
             }

  def initialize(promotional_rules = {})
    @promotional_rules = promotional_rules
    @basket = []

  end

  def scan(item)
    @basket.push(item)
  end

  def empty
    @basket.clear
    total
  end

  def check_for_promotional_rules
    @promotional_rules.each do |rule, active|
      if rule.active
    end
  end

  def total
    'Your basket is empty!'
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
