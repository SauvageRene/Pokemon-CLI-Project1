require 'pry'

class CLI

    def pokemon_art
        puts <<-'ART'.blue
                                      ,'\                             
        _.----.        ____         ,'  \   ___    ___     ____       
    _,-'       `.     |    |  /`.   \,-''   |   \  /   |   |    \  |`. 
    \      __    \    '-.  | /   `.  ___    |    \/    |   '-.   \ |  |
     \.    \ \   |  __  |  |/    ,','_  `.  |          | __  |    \|  |
       \    \/   /,' _`.|      ,' / / / /   |          ,' _`.|     |  |
        \     ,-'/  /   \    ,'   | \/ / ,`.|         /  /   \  |     |
         \    \ |   \_/  |   `-.  \    `'  /|  |    ||   \_/  | |\    |
          \    \ \      /       `-.`.___,-' |  |\  /| \      /  | |   |
           \    \ `.__,'|  |`-._    `|      |__| \/ |  `.__,'|  | |   |
            \_.-'       |__|    `-._ |              '-.|     '-.| |   |
                                    `'                            '-._|
        ART
    end

    def run
        API.grab_pokemon
        pokemon_art
        puts "Welcome PokeMaster!"
        puts "If you want a list of pokemon availble in PoGo enter 'yes'"
        puts "To exit the application, enter 'exit'"
        menu
        #binding.pry
    end

    def menu
        input = gets.chomp
        if input == "yes"
            pokemon_list
        elsif input == "exit"
            goodbye
        else
            invalid_entry
        end
    end

    def input_to_index(input)
        input.to_i - 1
    end

     def pokemon_list
        new_array = Pokemon.all #uniq{|pokemon| pokemon[:pokemon_name]} 
         new_array.each_with_index do |pokemon, index|
             puts "#{index + 1}. #{pokemon.pokemon_name}"
         end
     end

   
    def goodbye
        puts "Go catch them all! Goodbye."
    end

    def invalid_entry
        puts "Invalid entry, please try again."
        menu
    end


end