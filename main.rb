require_relative 'lib/thing'
require_relative 'lib/collection_of_things'

things_paths = Dir["#{__dir__}/data/*.txt"]
things = CollectionOfThings.things_from_folder(things_paths)
collection_of_thing = CollectionOfThings.new(things)

puts 'Сколько градусов сегодня за окном? (можно с минусом)'
user_input = STDIN.gets.to_i

wear_for_user = collection_of_thing.what_to_wear(user_input)

if wear_for_user.any?
  puts 'Предлагаем сегодня надеть:'
  puts wear_for_user
else
  puts 'В нашей колекции отсутствует подходящая одежда'
end
