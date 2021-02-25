require 'pry'

class API 
    
    def self.grab_pokemon
        API_URL = "https://pogoapi.net/api/v1/pokemon_stats.json"
        response = HTTParty.get(API_URL)
        json = JSON.parse(response.body)
      binding.pry
    end
end