require_relative 'app/models/meal'
require_relative 'app/repositories/meals_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/models/customer'
require_relative 'app/repositories/customers_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'app/repositories/employees_repository'
require_relative 'app/controllers/sessions_controller'

require_relative 'app/repositories/orders_repository'
require_relative 'app/controllers/orders_controller'


require_relative 'router'

employees_csv = 'data/employees.csv'
employees_repository = EmployeesRepository.new(employees_csv)
session_controller = SessionsController.new(employees_repository)


meals_csv = 'data/meals.csv'
meals_repository = MealsRepository.new(meals_csv)
meals_controller = MealsController.new(meals_repository)

customers_csv = 'data/customers.csv'
customers_repository = CustomersRepository.new(customers_csv)
customers_controller = CustomersController.new(customers_repository)

orders_csv = 'data/orders.csv'
orders_repository = OrdersRepository.new(orders_csv, employees_repository, customers_repository, meals_repository)
orders_controller = OrdersController.new(orders_repository, customers_repository, meals_repository, employees_repository)

router = Router.new(meals_controller, customers_controller, session_controller, orders_controller)
router.run
