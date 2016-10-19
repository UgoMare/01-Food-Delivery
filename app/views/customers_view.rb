require_relative 'base_view'

class CustomersView < BaseView
  def list(customers)
    customers.each do |customer|
      puts "#{customer.name} #{customer.address}"
    end
  end
end
