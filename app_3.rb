require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

puts " "

puts "Quel est ton prénom?"
print ">"
name = gets.chomp

my_game = Game.new(name)

while my_game.is_still_ongoing? == true 
  my_game.show_players
  gets.chomp
  my_game.new_players_in_sight
  gets.chomp
  my_game.menu
  choice = gets.chomp
  my_game.menu_choice(choice)
  puts my_game.kill_player
  gets.chomp
  my_game.enemies_attack
end

my_game.end