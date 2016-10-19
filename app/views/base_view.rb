class BaseView
  def ask_for(label)
    puts "#{label}?"
    print '> '
    gets.chomp
  end

  def ask_for_value(label)
    ask_for(label).to_i
  end

  def ask_for_index
    ask_for_value('Index') - 1
  end

  def list(elements)
    elements.each_with_index do |element, index|
      puts "#{index + 1}. #{element.to_s}"
    end
  end
end
