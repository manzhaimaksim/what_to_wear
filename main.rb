require_relative 'lib/thing'
require_relative 'lib/collection_of_things'

collection = CollectionOfThings.new(Dir[__dir__ + '/data/*.txt'])

puts 'Сколько градусов сегодня за окном? (можно с минусом)'
user_input = STDIN.gets.to_i

puts 'Предлагаем сегодня надеть:'
puts

puts collection.what_to_wear(user_input)
