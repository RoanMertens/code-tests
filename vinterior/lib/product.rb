# products of the store
class Product
  attr_reader :name, :price, :product_code, :count, :instances
  @@count = 0
  @@instances = []

  def initialize(params)
    @name = params[:name]
    @price = params[:price]
    @@count += 1
    @@instances << self
    @product_code = create_prod_code
  end

  def create_prod_code
    string_code = ''
    a = 3 - @@count.to_s.length
    a.times { string_code << '0' }
    string_code << @@count.to_s
  end
end
