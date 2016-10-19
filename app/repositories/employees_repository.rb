require_relative 'base_repository'
require_relative '../models/employee'

class EmployeesRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    Employee.new(row)
  end

  def build_row(employee)
    [employee.id, employee.username, employee.password, employee.role]
  end

  def csv_header
    ['id', 'username', 'password', 'role']
  end

  def find_by_username(username)
    all.find { |employee| employee.username == username }
  end
end
