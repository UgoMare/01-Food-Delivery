require_relative '../models/meal'
require_relative 'base_repository'

class MealsRepository < BaseRepository
  def format(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end

  def to_csv(meal)
    [meal.id, meal.name, meal.price]
  end

  def csv_header
    ['id', 'name', 'price']
  end
end
