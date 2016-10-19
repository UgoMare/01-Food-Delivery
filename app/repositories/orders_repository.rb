# require_relative 'employees_repository'
# require_relative 'meals_repository'
# require_relative 'customers_repository'

require_relative 'base_repository'
require_relative '../models/order'

class OrdersRepository < BaseRepository
  def initialize(csv_file, employees_repository, customers_repository, meals_repository)
    @employees_repository = employees_repository
    @customers_repository = customers_repository
    @meals_repository = meals_repository
    super(csv_file)
  end

  def build_element(row)
    row[:id] = row[:id].to_i
    row[:employee] = @employees_repository.find(row[:employee_id].to_i)
    row[:customer] = @customers_repository.find(row[:customer_id].to_i)
    row[:meal] = @meals_repository.find(row[:meal_id].to_i)
    row[:delivered] = row[:delivered] == 'true'
    Order.new(row)
  end

  def build_row(order)
    [order.id, order.delivered, order.meal.id, order.customer.id, order.employee.id]
  end

  def csv_header
    ['id', 'delivered', 'meal_id', 'customer_id', 'employee_id']
  end

  def find_with_employee_id(employee_id)
    all.select { |order| order.employee.id == employee_id }
  end


end

# repo_e = EmployeesRepository.new('data/employees.csv')
# repo_c = CustomersRepository.new('data/customers.csv')
# repo_m = MealsRepository.new('data/meals.csv')

# repo = OrdersRepository.new('data/orders.csv', repo_e, repo_c, repo_m)
# p repo
