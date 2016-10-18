require_relative '../models/meal'
require_relative 'base_repository'

class MealsRepository < BaseRepository
  def build_element(row)
    row[:id] = row[:id].to_i
    row[:price] = row[:price].to_i
    Meal.new(row)
  end

  def build_row(meal)
    [meal.id, meal.name, meal.price]
  end

  def csv_header
    ['id', 'name', 'price']
  end
end
