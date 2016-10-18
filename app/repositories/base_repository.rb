require 'csv'

class BaseRepository
  def initialize(csv_file)
    @elements = []
    @next_id = 1
    @csv_file = csv_file
    load_csv if File.exist?(@csv_file)
  end

  def add(element)
    element.id = @next_id
    @next_id += 1
    @elements << element
    save_csv
  end

  def find(id)
    @elements.find{ |element| element.id == id }
  end

  def all
    @elements
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      element = format(row)
      @elements << element
      @next_id = element.id
    end
    @next_id += 1
  end

  def save_csv
    CSV.open(@csv_file, 'w') do |csv|
      csv << csv_header
      @elements.each do |element|
        csv << to_csv(element)
      end
    end
  end
end
