require_relative 'lib/thing'

things_path = __dir__ + '/data'
things = Thing.things_from_folder(things_path)

puts 'Сколько градусов сегодня за окном? (можно с минусом)'
user_input = STDIN.gets.to_i

puts 'Предлагаем сегодня надеть:'
puts "#{user_input}"
