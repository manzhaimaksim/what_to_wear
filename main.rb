require_relative 'lib/thing'
require_relative 'lib/collection_of_things'

things_paths = Dir[__dir__ + '/data/*.txt']

collection = CollectionOfThings.new
collection.things_from_folder(things_paths)

puts 'Сколько градусов сегодня за окном? (можно с минусом)'
user_input = STDIN.gets.to_i

puts 'Предлагаем сегодня надеть:'
puts

collection.what_to_wear(user_input).each { |thing| puts thing unless thing.nil? }
