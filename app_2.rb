require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


puts <<-'EOF'


'
            \                                           ___/________
       ___   )                    ,  @                    /    \  \
    @___, \ /                  @__\  /\              @___/      \@/
   /\__,   |                  /\_, \/ /             /\__/        |
  / \    / @\                / \   (               / \ /        / \
_/__|___/___/_______________/__|____\_____________/__/__________|__\__'
														

EOF

puts "ARE YOU READY TO FIGHT?\n"

#Players init
puts "Salutions jeune guerrier, quel est ton nom?"
print "> "
input = gets.chomp
player1 = HumanPlayer.new(input)


#Enemies init
@@enemies = [] #array of enemies
enemy1 = Player.new("Terminator")
enemy2 = Player.new("Dark Vador")

@@enemies << enemy1
@@enemies << enemy2


def alive?(player1)
	puts "\nVoici ton état : "
	player1.show_state
	puts "\n"
end

def fight(player1,enemy1,enemy2,enemies)
	
	while player1.life_points > 0 && (enemy1.life_points > 0 || enemy2.life_points > 0)
	  
	  alive?(player1) #show the player's state

	  puts "Quelle action veux-tu effectuer? \n\n"
	  puts "a - chercher une meilleure arme"
	  puts "s - chercher à se soigner\n\n"

		puts "Ou même attaquer un joueur en vue :\n\n"
		print "0 - " 
		enemy1.show_state
		print "1 - "
		enemy2.show_state
		puts "\n"

		input = gets.chomp #allows the player to type their choice in

		if input == "a" #allows to get a new weapon
			player1.search_weapon

		elsif input == "s"
			player1.search_health_pack

		elsif input == "0"
			if enemy1.life_points <=0 
				puts "Bad moove, il est déjà mort tu sais..."
			else
			player1.attacks(enemy1)
			end

		elsif input == "1"
			if enemy2.life_points <=0 
				puts "Bad moove, il est déjà mort tu sais..."
			else
			player1.attacks(enemy2)
			end
		end

		#the enemies are going to attack : 
		puts "Attention, un ennemi sauvage t'attaque ! \n"

		
		enemies.each do |enemy|    #each enemy is going to do the action
			if enemy.life_points <=0 
	  		puts "Ouch tu as eu chaud, un des ennemi est mort, il ne peut pas t'attaquer."
	  	else
			enemy.attacks(player1)
			end
		end

	end

	puts "La partie est finie. \n"

	if player1.life_points > 0
		puts "BRAVO ! TU LES A ECLATEEES"
	else
		puts "Tu n'as pas su écraser Terminator et Dark Vador..."
	end

end


#launch the game
fight(player1,enemy1,enemy2,@@enemies)

