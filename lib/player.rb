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