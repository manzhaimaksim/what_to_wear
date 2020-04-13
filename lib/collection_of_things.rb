class CollectionOfThings
  def initialize(collection)
    @collection = collection
    @categories = []
  end

  # возвращает массив с типами одежды
  def categories_of_things
    @categories = @collection.map(&:category).uniq
  end

  # возвращает массив с объектами одной категории
  def things_of_same_type(type)
    @collection.select { |thing| thing.category == type }
  end
end
