require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

#Intro du jeu
puts "------------------------------------------------
|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |
|Le but du jeu est d'être le dernier survivant !|
-------------------------------------------------"

#Initialisation du joueur
puts "Quel est ton prénom ?"
print "> "
human_player_name = gets.chomp
user = HumanPlayer.new(human_player_name)

#Initialisation des ennemis
player1 = Player.new("Josiane")
player2 = Player.new("José")

enemies = Array.new
enemies << Player

#Combat
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state
end

#Fin du jeu
puts "La partie est finie"
if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end