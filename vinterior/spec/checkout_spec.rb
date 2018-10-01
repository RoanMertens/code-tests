require 'checkout'
require 'product'

describe Checkout do
  params_one = { name: 'Very Cheap Chair', price: 925 }
  params_two = { name: 'Little table', price: 4500 }
  params_three = { name: 'Funky light', price: 1995 }
  prod_one = Product.new(params_one)
  prod_two = Product.new(params_two)
  prod_three = Product.new(params_three)
  checkout_no_pr_rules = Checkout.new
  checkout_all_pr_rules = Checkout.new(multiple_very_cheap_chairs: true,
                                       spend_over_sixty: true)

  it 'no promotional_rules|basket: empty |total price: £0.00' do
    expect(checkout_no_pr_rules.total).to eq 'Your basket is empty!'
  end

  it 'no promotional_rules|basket: 001, 002, 003|total price: £74.20' do
    checkout_no_pr_rules.scan(prod_one)
    checkout_no_pr_rules.scan(prod_two)
    checkout_no_pr_rules.scan(prod_three)
    expect(checkout_no_pr_rules.total).to eq '£74.20'
  end

  it "basket content is ['001', '002', '003']}" do
    expect(checkout_no_pr_rules.basket).to eq [prod_one, prod_two, prod_three]
  end

  it 'basket content is []' do
    checkout_no_pr_rules.empty
    expect(checkout_no_pr_rules.total).to eq 'Your basket is empty!'
  end

  it 'all promotional_rules|basket: 001, 002, 003|total price: £66.78' do
    checkout_all_pr_rules.scan(prod_one)
    checkout_all_pr_rules.scan(prod_two)
    checkout_all_pr_rules.scan(prod_three)
    expect(checkout_all_pr_rules.total).to eq '£66.78'
    checkout_all_pr_rules.empty
  end

  it 'no promotional_rules|basket: 001, 003, 001|total price: £38.45' do
    checkout_no_pr_rules.empty
    checkout_no_pr_rules.scan(prod_one)
    checkout_no_pr_rules.scan(prod_three)
    checkout_no_pr_rules.scan(prod_one)
    expect(checkout_no_pr_rules.total).to eq '£38.45'
  end

  it 'all promotional_rules|basket: 001, 003, 001|total price: £36.95' do
    checkout_all_pr_rules.empty
    checkout_all_pr_rules.scan(prod_one)
    checkout_all_pr_rules.scan(prod_three)
    checkout_all_pr_rules.scan(prod_one)
    expect(checkout_all_pr_rules.total).to eq '£36.95'
  end

  it 'all promotional_rules|basket: 001, 002, 001, 003|total price: £73.76' do
    checkout_all_pr_rules.empty
    checkout_all_pr_rules.scan(prod_one)
    checkout_all_pr_rules.scan(prod_two)
    checkout_all_pr_rules.scan(prod_one)
    checkout_all_pr_rules.scan(prod_three)
    expect(checkout_all_pr_rules.total).to eq '£73.76'
  end
end
