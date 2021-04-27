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
end