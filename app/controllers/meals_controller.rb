require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  # Behavior
  # list
  # add

  def initialize(meals_repository)
    @meals_repository = meals_repository
    @meals_view = MealsView.new
  end

  def add
    # Ask/Get the name and the price from the user
    # Create a new instance of meal
    # Add my instance to my repo

    name = @meals_view.ask_for_name
    price = @meals_view.ask_for_price
    meal = Meal.new(name: name, price: price)
    @meals_repository.add(meal)
  end

  def list
    # Display the list of the meals

    @meals_view.list(@meals_repository.all)
  end
end
