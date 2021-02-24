require 'pry'

class API 
    
    def self.grab_pokemon
        pokedex = 'https://pokeapi.co/api/v2/pokemon/'
        data_hash = HTTParty.get(pokedex)
        array_of_data = pokedex["results"]
        array_of_data.each do |name|
            Pokemon.new(name)
        end
    end
end