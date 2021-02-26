 require 'pry'
 #require 'httparty'

class API

    def self.grab_pokemon
        url = 'https://pogoapi.net/api/v1/pokemon_stats.json'
        pogo_array = HTTParty.get(url).body
        new_pogo_array = JSON.parse(pogo_array)
        binding.pry
        new_pogo_array.each do |pokemon|
            Pokemon.new(pokemon)
        end
    end
end

#api = API.new
#API.grab_pokemon