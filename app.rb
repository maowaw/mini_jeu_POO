#make the gems available for all files
require 'bundler'
Bundler.require

#calls the 2 other files in lib
require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Terminator")
player2 = Player.new("Dark Vador")


def alive?(player1,player2)
	puts "\nVoici l'état des guerriers : "
	player1.show_state
	player2.show_state 
	puts "\n"
end

def fight(player1,player2)

	puts <<-'EOF'
	
	( •_•)                            (•_• ) 
	( ง )ง                            ୧(୧ )
	/︶\                               /︶\ 
	
	EOF

	while player1.life_points > 0 && player2.life_points > 0
	  
	  alive?(player1,player2)
	  
	  puts "Adjimé !"
	  
	  player2.attacks(player1)  
	  	
	  	if player1.life_points <=0 
	  		break
	  	else
	  	player1.attacks(player2)
	  	end  
	end 

end

fight(player1,player2)




#allows to make every test in the terminal with pry by executing ruby app.rb
#binding.pry