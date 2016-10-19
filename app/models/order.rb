class Order
  # STATE:
  # id
  # meal
  # customer
  # employee
  # delivered

  attr_accessor :id, :delivered
  attr_reader :meal, :customer, :employee

  def initialize(attributes = {})
    @id = attributes[:id]
    @delivered = attributes[:delivered] || false
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
  end

  def to_s
    "Order ##{@id} #{@delivered ? 'Delivered' : 'To deliver'}"
  end

  def delivered!
    @delivered = true
  end

end
