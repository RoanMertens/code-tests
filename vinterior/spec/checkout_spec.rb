require 'checkout'

describe Checkout do
  checkout_no_pr_rules = Checkout.new
  checkout_all_pr_rules = Checkout.new(multiple_very_cheap_chairs: true,
                                       spend_over_sixty: true)

  it 'no promotional_rules|basket: empty |total price: £0.00' do
    expect(checkout_no_pr_rules.total).to eq 'Your basket is empty!'
  end

  it 'no promotional_rules|basket: 001, 002, 003|total price: £74.20' do
    checkout_no_pr_rules.scan('001')
    checkout_no_pr_rules.scan('002')
    checkout_no_pr_rules.scan('003')
    expect(checkout_no_pr_rules.total).to eq '£74.20'
  end

  it "basket content is #{%w[001 002 003]}" do
    expect(checkout_no_pr_rules.basket).to eq %w[001 002 003]
  end

  it 'basket content is []' do
    checkout_no_pr_rules.empty
    expect(checkout_no_pr_rules.total).to eq 'Your basket is empty!'
  end

  it 'all promotional_rules|basket: 001, 002, 003|total price: £66.78' do
    checkout_all_pr_rules.empty
    checkout_all_pr_rules.scan('001')
    checkout_all_pr_rules.scan('002')
    checkout_all_pr_rules.scan('003')
    expect(checkout_all_pr_rules.total).to eq '£66.78'
  end

  it 'no promotional_rules|basket: 001, 003, 001|total price: £38.45' do
    checkout_no_pr_rules.empty
    checkout_no_pr_rules.scan('001')
    checkout_no_pr_rules.scan('003')
    checkout_no_pr_rules.scan('001')
    expect(checkout_no_pr_rules.total).to eq '£38.45'
  end

  it 'all promotional_rules|basket: 001, 003, 001|total price: £36.95' do
    checkout_all_pr_rules.empty
    checkout_all_pr_rules.scan('001')
    checkout_all_pr_rules.scan('003')
    checkout_all_pr_rules.scan('001')
    expect(checkout_all_pr_rules.total).to eq '£36.95'
  end

  it 'all promotional_rules|basket: 001, 002, 001, 003|total price: £73.76' do
    checkout_all_pr_rules.empty
    checkout_all_pr_rules.scan('001')
    checkout_all_pr_rules.scan('002')
    checkout_all_pr_rules.scan('001')
    checkout_all_pr_rules.scan('003')
    expect(checkout_all_pr_rules.total).to eq '£73.76'
  end
end
