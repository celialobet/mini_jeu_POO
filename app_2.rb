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
enemies = [player1, player2]

#Combat
while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  user.show_state

  puts " "
  puts "Quelle action veux-tu effectuer ?"
  puts " "
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts " "
  puts "attaquer un joueur en vue :"
  i = 0
  enemies.each do |enemy|
    puts "#{i} - #{enemy.show_state}"
    i += 1
  end
  puts "> "
  input = gets.chomp

  case input
  when 'a'
    user.search_weapon
  when 's'
    user.search_health_pack
  when '0'
    user.attacks(player1)
  when '1'
    user.attacks(player2)
  else 
    "Wrong input"
  end

  #Tour des ennemis de riposter
  puts "Les autres joueurs t'attaquent !"
  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(user)
    end
  end
end

#Fin du jeu
puts "La partie est finie"
if user.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else
  puts "Loser ! Tu as perdu !"
end