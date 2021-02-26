require 'pry'

class Pokemon
    attr_accessor :pokemon_name, :pokemon_id, :base_attack, :base_defense, :base_stamina
    @@all = []

    def initialize(attr_hash) # the hash assigns values to keys so values can be looked up by their key
        attr_hash.each do |key, value|
         self.send("#{key}=", value) if self.respond_to?("#{key}=")
         #binding.pry
        end
        save #binding.pry
    end

    def self.all
         @@all
    end

    def save
        @@all << self
    end

    def self.find_by_name(name)
        self.all.find{|pokemon| pokemon.pokemon_name == name}
    end

    # def self.merge_if?
    #     attr_accessor.slice('pokemon_name', 'pokemon_id', 'base_attack', 'base_defense', 'base_stamina').values.join(":")
    # end
    # binding.pry

end