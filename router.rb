class Router
  def initialize(meals_controller, customers_controller, session_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @session_controller = session_controller
  end

  def run
    loop do
      @employee = @session_controller.sign_in
      while @employee
        if @employee.manager?
          print_menu_manager
          action = ask_for_action
          print `clear`
          route_manager(action)
        else
          print_menu_delivery_guy
          action = ask_for_action
          print `clear`
          route_delivery_guy(action)
        end
      end
    end
  end

  private

  def print_menu_manager
    puts '1 - List the meals'
    puts '2 - Add a new meal'
    puts '3 - List the customers'
    puts '4 - Add a new customer'
    puts '0 - Logout'
  end

  def print_menu_delivery_guy
    puts '1 - List my orders'
    puts '2 - Mark an order as delivered'
    puts '0 - Logout'
  end

  def ask_for_action
    puts 'What is your choice?'
    print '> '
    return gets.chomp.to_i
  end

  def route_manager(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
    when 0 then @employee = nil
    else
      puts 'Wrong action'
    end
  end

  def route_delivery_guy(action)
    case action
    when 1 then puts 'TODO: show orders assigned to the delivery guy'
    when 2 then puts 'TODO: Mark as delivered an order'
    when 0 then @employee = nil
    else
      puts 'Wrong action'
    end
  end
end
