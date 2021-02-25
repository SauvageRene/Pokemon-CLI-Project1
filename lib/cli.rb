#require 'pry'

class CLI

    def run
        API.grab_pokemon
        puts "Welcome PokeMaster!"
        puts "If you want a list of pokemon availble in PoGo enter 'Yes'"
        puts "To exit the application, enter 'exit'"
        binding.pry
    end
end