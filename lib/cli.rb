#require 'pry'

class CLI

    def run
        API.grab_pokemon
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
        Pokemon.all.each_with_index do |pokemon, index|
            puts "#{index + 1}. #{pokemon.pokemon_name}"
        end
        ask_user_input
    end

    def goodbye
        puts "Go catch them all! Goodbye."
    end

    def invalid_entry
        puts "Invalid entry, please try again."
        menu
    end


end