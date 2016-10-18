require_relative '../models/customer'
require_relative 'base_repository'

class CustomersRepository < BaseRepository
  def format(row)
    row[:id] = row[:id].to_i
    Customer.new(row)
  end

  def to_csv(customer)
    [customer.id, customer.name, customer.address]
  end

  def csv_header
    ['id', 'name', 'address']
  end
end
