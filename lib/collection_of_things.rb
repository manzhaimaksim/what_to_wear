class CollectionOfThings
  attr_reader :wear_for_user

  def initialize
    @collection = []
    @categories = []
    @wear_for_user = []
  end

  def things_from_folder(paths)
    paths.each do |path|
      lines = File.readlines(path, chomp: true, encoding: 'UTF-8')

      lines[2] = lines[2].delete('()').split(', ').map(&:to_i)

      params = { title: lines[0], category: lines[1], temp_range: lines[2][0]..lines[2][1] }
      @collection << Thing.new(params)
    end
  end

  def what_to_wear(temperature)
    categories_of_things.each do |category|
      @wear_for_user << things_of_same_type(category).select do |thing|
        thing.suitable_for_weather?(temperature)
      end
      .sample
    end
  end

  private

  # возвращает массив с категориями одежды
  def categories_of_things
    @categories = @collection.map(&:category).uniq
  end

  # возвращает массив с объектами одной категории
  def things_of_same_type(type)
    @collection.select { |thing| thing.category == type }
  end
end
