require 'pry'

class API 
    
    def self.grab_pokemon
        URL = "https://pogoapi.net/api/v1/pokemon_rarity.json"
        data_hash = HTTParty.get(URL)
        array_of_data = data_hash
        array_of_data.each do |name|
            Pokemon.new(name)
        end
    end
    binding.pry
end