#require 'pry'

class CLI

    def run
        API.grab_pokemon
        puts "Welcome PokeMaster!"
        puts "If you want a list of pokemon availble in PoGo enter 'Yes'"
        puts "To exit the application, enter 'exit'"
        binding.pry
    end

    def menu
    end

    def input_to_index(input)
        input.to_i - 1
    end
end