class Player
  attr_accessor :name, :life_points

  def initialize(player_name)
    @name = player_name
    @life_points = 10
  end

  def show_state
    if @life_points > 0
      puts "#{@name} a #{@life_points} points de vie"
    elsif @life_points <= 0
      puts "#{@name} a 0 points de vie"
    end
  end

  def gets_damage(damage_points)
    @life_points -= damage_points
    if @life_points <= 0
      puts "Le joueur #{@name} a été tué !"
    end
  end

  def attacks(player)
    puts "#{@name} attaque #{player.name}" 
    damage_num = compute_damage
    player.gets_damage(damage_num)
    puts "il lui inflige #{damage_num} points de dommages"
  end

  def compute_damage
    return rand(1..6)
  end

end

class HumanPlayer < Player
  attr_accessor :weapon_level 

  def initialize(player_name)
    @life_points = 100
    @weapon_level = 1

    super(player_name)
  end

  def show_state
    if @life_points > 0
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    elsif @life_points <= 0
      puts "#{@name} a 0 points de vie"
    end
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon = rand(1..6) 
    puts "Tu as trouvé une arme de niveau #{new_weapon}"
    if new_weapon > @weapon_level
      new_weapon = @weapon_level
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)
    if health_pack == 1
      puts "Tu n'as rien trouvé..."
    elsif health_pack >= 2 && health_pack <= 5
      if @life_points > 0 && @life_points <= 50
      @life_points += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      end
    else 
      if @life_points > 0 && @life_points <= 20
        @life_points += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
      end
    end
  end

end