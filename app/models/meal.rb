class Meal
  # STATE:
  # - name (String)
  # - price (Fixnum)
  # - id (Fixnum)

  attr_accessor :id
  attr_reader :name, :price

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
