require 'pry'

class API 
    
    def self.grab_pokemon
        API_URL = "https://pogoapi.net/api/v1/pokemon_stats.json"
        response = HTTParty.get(API_URL)
        array_of_data = data_hash
        array_of_data.each do |name|
            Pokemon.new(name)
        end
    end
    binding.pry
end