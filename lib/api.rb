require 'pry'

class API 

    API_URL = 'https://pogoapi.net/api/v1/pokemon_stats.json'

    def grab_pokemon
        response = HTTParty.get(API_URL)
        pogo_array = JSON.parse(response.body)
        pogo_array.each do |pokemon|
            Pokemon.new(pokemon)
        end
    end
    binding.pry
end