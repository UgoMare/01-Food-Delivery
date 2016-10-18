class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
  end

  def run
    loop do
      print_menu
      action = ask_for_action
      route(action)
    end
  end

  private

  def print_menu
    puts 'What is your choice'
    puts '1 - List the meals'
    puts '2 - Add a new meal'
    puts '3 - List the customers'
    puts '4 - Add a new customer'
  end

  def ask_for_action
    gets.chomp.to_i
  end

  def route(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    else
      puts 'Wrong action'
    end
  end
end
