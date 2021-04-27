class Game
  attr_accessor :human_player, :players_left, :enemies_in_sight

  def initialize(name)
    @enemies_in_sight = []
    @human_player = HumanPlayer.new(name)
    @players_left = 10
  end

  def kill_player(player)
    @enemies_in_sight.each do |player|
    if player.life_points <= O
      @enemies_in_sight.delete(player)
    end
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @players_left != 0
      return true
    else
      return false
    end
  end

  def show_players
    puts @human_player.show_state
    puts "Tu as #{@enemies_in_sight.length} ennemis en vue."
  end

  def menu
    @human_player.show_state
    puts " "
    puts "Quelle action veux-tu effectuer ?"
    puts " "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts " "
    puts "attaquer un joueur en vue :"
    i = 0
    @enemies_in_sight.each do |player|
      if player.life_points > 0
        puts "#{i} - #{player.show_state}"
        i += 1
      end
    end
  end

  def menu_choice(choice)
    if choice == "a"
      @human_player.search_weapon
    elsif choice == "s"
      @human_player.search_health_pack
    else
      @human_player.attacks(@enemies_in_sight[choice.to_i])
      if @enemies_in_sight[choice.to_i].life_points <= 0
        kill_player(@enemies_in_sight[choice.to_i])
      end
    end
  end

  #Riposte des ennemis
  def enemies_attack
    puts "Les autres joueurs t'attaquent !"
    @enemies_in_sight.each do |player|
      if player.life_points > 0
        player.attacks(@human_player)
      end
    end
  end

  #Fin du jeu
  def end
    puts "La partie est finie"
    if @human_player.life_points > 0
      puts "BRAVO ! TU AS GAGNE !"
    else
      puts "Loser ! Tu as perdu !"
    end
  end

  def new_players_in_sight
    if @enemies_in_sight.length == @players_left
      puts "Tous les ennemis sont déjà en vue"
    else
      dice_roll = rand(1..6)
      if dice_roll == 1
        puts "Pas de nouvel adversaire pour le moment"
      elsif dice_roll >= 2 && dice_roll <= 4
        @enemies_in_sight << Player.new("Joueur_#{rand(1000..6000)}")
        puts "Un nouvel adversaire vient d'arriver !"
      else
        @enemies_in_sight << Player.new("Joueur_#{rand(1000..6000)}")
        @enemies_in_sight << Player.new("Joueur_#{rand(1000..6000)}")
        puts "Deux nouveaux adversaires viennent d'arriver !"
      end
    end
  end
end
end