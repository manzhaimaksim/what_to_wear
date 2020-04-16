require_relative 'lib/thing'
require_relative 'lib/collection_of_things'

things_paths = Dir[__dir__ + '/data/*.txt']
things = CollectionOfThings.things_from_folder(things_paths)
collection_of_thing = CollectionOfThings.new(things)

puts 'Сколько градусов сегодня за окном? (можно с минусом)'
user_input = STDIN.gets.to_i

puts 'Предлагаем сегодня надеть:'
puts

puts collection_of_thing.what_to_wear(user_input)
