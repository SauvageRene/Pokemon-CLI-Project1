require 'pry'

class API 
    
    def self.grab_pokemon
        pokedex = 'https://pokeapi.co/api/v2/pokemon/'
        data_hash = HTTParty.get(pokedex)
        array_of_data = data_hash["results"]
        array_of_data.each do |name|
            Pokemon.new(name)
        end
    end
    binding.pry
end