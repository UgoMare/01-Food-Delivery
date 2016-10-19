require_relative 'app/repositories/employees_repository'

employees_csv = 'data/employees.csv'
repo = EmployeesRepository.new(employees_csv)

p repo
