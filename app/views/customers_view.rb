class CustomersView
  def ask_for(label)
    puts "#{label}?"
    print '> '
    gets.chomp
  end

  def list(customers)
    customers.each do |customer|
      puts "#{customer.name} #{customer.address}"
    end
  end
end
