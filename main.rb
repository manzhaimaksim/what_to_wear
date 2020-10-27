require_relative './lib/thing'
require_relative './lib/things_collection'

things_paths = Dir["#{__dir__}/data/*.txt"]
things = ThingsCollection.from_folder(things_paths)
things_collection = ThingsCollection.new(things)

puts 'Сколько градусов сегодня за окном? (можно с минусом)'
user_input = STDIN.gets.to_i

wear_for_user = things_collection.what_to_wear(user_input)

if wear_for_user.any?
  puts 'Предлагаем сегодня надеть:'
  puts wear_for_user
else
  puts 'В нашей колекции отсутствует подходящая одежда'
end
