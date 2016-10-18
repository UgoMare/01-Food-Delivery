class MealsView

  def list(meals)
    meals.each do |meal|
      puts "#{meal.name} $#{meal.price}"
    end
  end

  def ask_for_name
    puts 'name?'
    print '> '
    gets.chomp
  end

  def ask_for_price
    puts 'price?'
    print '> '
    gets.chomp.to_i
  end

end
