require_relative '../views/session_view'

class SessionsController
  def initialize(employees_repository)
    @employees_repository = employees_repository
    @sessions_view = SessionView.new()
  end

  def sign_in
    #1. Ask for the username
    #2. Ask for the password
    #3. Find an employee with this username
    #4. Compare password of the employee with the given password

    username = @sessions_view.ask_for('Username')
    password = @sessions_view.ask_for('Password')
    @employee = @employees_repository.find_by_username(username)
    if @employee && @employee.password == password
      return @employee
    else
      @sessions_view.try_again
      sign_in
    end
  end
end
