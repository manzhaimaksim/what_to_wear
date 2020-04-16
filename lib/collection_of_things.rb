class CollectionOfThings
  def initialize(things)
    @collection = things
  end

  def self.things_from_folder(paths)
    paths.map do |path|
      lines = File.readlines(path, chomp: true, encoding: 'UTF-8')
      params = { title: lines[0], category: lines[1], temp_range: convert_string_to_range(lines[2]) }
      Thing.new(params)
    end
  end

  def self.convert_string_to_range(string)
    string = string.delete('()').split(', ').map(&:to_i)
    string[0]..string[1]
  end

  def what_to_wear(temperature)
    categories_of_things.filter_map do |category|
      things_of_same_type(category).select do |thing|
        thing.suitable_for_weather?(temperature)&!nil?
      end.sample
    end
  end

  private

  # возвращает массив с категориями одежды
  def categories_of_things
    @collection.map(&:category).uniq
  end

  # возвращает массив с объектами одной категории
  def things_of_same_type(category)
    @collection.select { |thing| thing.category == category }
  end
end
