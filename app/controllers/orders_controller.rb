require_relative '../views/orders_view'
require_relative '../models/order'

class OrdersController
  def initialize(orders_repository, customers_repository, meals_repository, employees_repository)
    @orders_repository = orders_repository
    @customers_repository = customers_repository
    @meals_repository = meals_repository
    @employees_repository = employees_repository
    @orders_view = OrdersView.new
  end

  def list
    #diplay all the orders in a view
    @orders_view.list(@orders_repository.all)
  end

  def add
    #1 Ask for a customer
    #2 Ask for a meal
    #3 Ask for a employee
    #4 Retrieve customer, employee and the meal with their ids
    #5 Init my new order


    customers = @customers_repository.all
    @orders_view.list(customers)
    customer = customers[@orders_view.ask_for_index]

    meals = @meals_repository.all
    @orders_view.list(meals)
    meal = meals[@orders_view.ask_for_index]

    employees = @employees_repository.delivery_guys
    @orders_view.list(employees)
    employee = employees[@orders_view.ask_for_index]

    order = Order.new(employee: employee, meal: meal, customer: customer)
    @orders_repository.add(order)
  end

  def list_delivery_guy_orders(employee_id)
    orders = @orders_repository.find_with_employee_id(employee_id)
    @orders_view.list(orders)
    #Find all the orders for a given employee_id
  end

  def mark_order_as_delivered(employee_id)
    orders = @orders_repository.find_with_employee_id(employee_id)
    @orders_view.list(orders)
    order = orders[@orders_view.ask_for_index]
    order.delivered!
  end
end







