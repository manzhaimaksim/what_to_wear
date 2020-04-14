require_relative 'lib/thing'
require_relative 'lib/collection_of_things'

things_paths = Dir[__dir__ + '/data/*.txt']

collection = CollectionOfThings.new
collection.things_from_folder(things_paths)

puts 'Сколько градусов сегодня за окном? (можно с минусом)'
user_input = STDIN.gets.to_i

collection.what_to_wear(user_input)
puts 'Предлагаем сегодня надеть:'
puts

collection.wear_for_user.each { |thing| puts thing unless thing.nil? }
