require_relative '../models/employee'

class EmployeesRepository
  def initialize(db)
    @db = db
    @elements = []
    load_db
  end

  def find_by_username(username)
    all.find { |employee| employee.username == username }
  end

  def delivery_guys
    all.select { |employee| employee.role == 'delivery_guy' }
  end

  def find(id)
    @elements.find{ |element| element.id == id }
  end

  def all
    @elements
  end
  private

  def load_db
    rows = @db.execute('SELECT id, username, password, role FROM employees')
    rows.each do |row|
      employee = Employee.new(id: row[0], username: row[1], password: row[2], role: row[3])
      @elements << employee
    end
  end
end
