# As user I can:
# Make a new checkout with the selected promotional_rules.
# Add items to my checkout.
# Show the total price. (with the applied promotional_rules)

# makes shopping baskets
class Checkout
  attr_reader :basket

  PRODUCTS = { '001' => ['Very Cheap Chair', 925],
               '002' => ['Little table', 4500],
               '003' => ['Funky light', 1995] }.freeze

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

  def total
    return 'Your basket is empty!' if @basket.empty?
    check_for_promotional_rules
    @final_price.round.to_s.insert(-3, '.').prepend('£')
  end

  # promotional rules
  def check_for_promotional_rules
    @promotional_rules.each { |rule, active| send(rule) if active }
  end

  def multiple_very_cheap_chairs
    amount_vcc = @basket.count('001')
    return false unless amount_vcc >= 2
    @final_price -= amount_vcc * PRODUCTS['001'][1]
    @final_price += (amount_vcc * 850)
  end

  def spend_over_sixty
    @final_price *= 0.9 if @final_price > 6000
  end
end
