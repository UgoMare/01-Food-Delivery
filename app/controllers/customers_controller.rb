require_relative '../views/customers_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customers_repository)
    @customers_repository = customers_repository
    @customers_view = CustomersView.new
  end

  def add
    name = @customers_view.ask_for('Name')
    address = @customers_view.ask_for('Address')
    customer = Customer.new(name: name, address: address)
    @customers_repository.add(customer)
  end

  def list
    @customers_view.list(@customers_repository.all)
  end
end
