require_relative 'app/models/meal'
require_relative 'app/repositories/meals_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/models/customer'
require_relative 'app/repositories/customers_repository'
require_relative 'app/controllers/customers_controller'


require_relative 'router'


meals_csv = 'data/meals.csv'
meals_repository = MealsRepository.new(meals_csv)
meals_controller = MealsController.new(meals_repository)

customers_csv = 'data/customers.csv'
customers_repository = CustomersRepository.new(customers_csv)
customers_controller = CustomersController.new(customers_repository)


router = Router.new(meals_controller, customers_controller)
router.run
