class CollectionOfThings
  attr_reader :wear_for_user

  def initialize(collection)
    @collection = collection
    @categories = @collection.map(&:category).uniq  # хранит массив с категориями одежды
    @wear_for_user = []
  end

  def what_to_wear(temperature)
    @categories.each do |category|
      @wear_for_user << things_of_same_type(category).select do |thing|
        thing.suitable_for_weather?(temperature)
      end.sample
    end
  end

  private

  # возвращает массив с объектами одной категории
  def things_of_same_type(type)
    @collection.select { |thing| thing.category == type }
  end
end
