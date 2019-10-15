

class Player
	
	attr_accessor :name, :life_points   #read&write attributes
	

	def initialize (name) #allows to create a player. we only have to type the name in
		@name = name
		@life_points = 10 #every player has 10 points at the beginning. without coma so it knows it's an integer

	end

	def show_state #allows to show the state of the player
		puts "#{@name} a #{@life_points} points de vie"
	end

	def gets_damage (damage) #when the player undergoes an attack

		@life_points = @life_points - damage #to_i in case a petit malin wants to put a float
				
		#announce the death :
		if @life_points <= 0 
			puts "Oh damnnn, #{@name} a été anéanti.."
		end
	end


	def compute_damage #assigning a random damage
		return rand(1..6)
  end


	def attacks(player_2) #announce who's attacking who

	
		puts "Le joueur #{@name} attaque le joueur #{player_2.name}"

		damage_attack = compute_damage #stock the random number in a var called damage_attack
		player_2.gets_damage(damage_attack) #applies the function gets_damage		

		if player_2.life_points <= 0 #important for exo app_2.rb so that it doesn't display negative life points
			player_2.life_points = 0
		
		else
			puts "Il lui inflige #{damage_attack} points de dommage ! "

		end
	
	end

end


#Exo app_2.rb

class HumanPlayer < Player
	
	attr_accessor :weapon_level #adding the attribute

 def initialize(name)

 		super(name) #fait appel au initialize de la classe player
   	@weapon_level = 1 #initialize the var
		@life_points = 100 #initialize the var
	
	end

	def show_state
		puts "Bonsoiiir ! Tu t'appelles #{@name}, tu as #{@life_points} points de vie et une arme sacrément puissante de #{weapon_level}"
	end

	def compute_damage #new compute_damage taking in account the weapon level
    return rand(1..6) * @weapon_level
  end
  
  def search_weapon #allows the player to get a better weapon
  	new_weapon = rand(1..6)
  	puts "Waw, tu as trouvé une arme de niveau #{new_weapon}" 

  	if new_weapon > @weapon_level #changes the weapon only if it's better
  		puts "Youhou, cette arme est meilleure que la tienne ! Tu la prends."
  		@weapon_level = new_weapon 
  	
  	else 
    	puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."

    end
	end

	def search_health_pack #allows the player to increase his life points
		health_pack = rand(1..6)

		if health_pack == 1
			puts "Tu n'as rien trouvé.. Ta vie reste à #{@life_points}"

		elsif health_pack >= 2 && health_pack <= 5
			puts "Bravo, tu as trouvé 50 petits coeurs"
			@life_points = @life_points + 50
			
			if @life_points > 100
				@life_points = 100
			end
		puts "Ta vie est maintenant à #{@life_points}"

		else 
			puts "La classe, tu as trouvé 80 petits coeurs !!"
			@life_points = @life_points + 80
			if @life_points > 100
				@life_points = 100
			end
		puts "Ta vie est maintenant à #{@life_points}"
		end
 end

end
