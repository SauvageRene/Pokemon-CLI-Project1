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
        new_array = Pokemon.all
         new_array.each_with_index do |pokemon, index|
             puts "#{index + 1}. #{pokemon.pokemon_name}"
         end
         puts ""
         ask_user_input
     end

   
    def goodbye
        puts "Go catch them all! Goodbye."
    end

    def invalid_entry
        puts "Invalid entry, please try again."
        menu
    end

    def ask_user_input
        puts "which Pokemon would you like more details about?(Type number)"
        input = gets.chomp
        index = input_to_index(input)
        if index.between?(0, Pokemon.all.size-1) #allows user to input pokemon via index
            display_pokemon_info(index)
        else
            puts "Invalid entry, try again."
            ask_user_input
        end
    end

    def display_pokemon_info(index)
        pokemon = Pokemon.all[index]
        
        puts "Name: #{pokemon.pokemon_name}"
        puts "Pokemon_id: #{pokemon.pokemon_id}"
        puts "Base_Attack: #{pokemon.base_attack}"
        puts "Base_Defense: #{pokemon.base_defense}"
        puts "Base_Stamina: #{pokemon.base_stamina}"
        another_pokemon?
    end

    def another_pokemon?
        puts "Get details on another pokemon?"
        puts "1. yes"
        puts "2. no"
        input = gets.chomp
        index = input_to_index(input)

        if input == "1" || "yes"
            pokemon_list
        elsif input == "2" ||"no"
            goodbye
        else
            puts "Invalid entry, try again"
            another_pokemon?
        end
    end

end