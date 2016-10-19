require_relative 'base_view'

class SessionView < BaseView

  def try_again
    puts 'Wrong credentials .. Try again'
  end
end
