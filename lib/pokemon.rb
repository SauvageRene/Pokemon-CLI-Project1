#require 'pry'

class Pokemon
    attr_accessor :pokemon_name, :pokemon_id, :base_attack, :base_defense, :base_stamina
    @@all = []

    def initialize(attr_hash) # the hash assigns values to keys so values can be looked up by their key
        attr_hash.each do |key, value|
            self.class.attr_accessor()
            self.send("#{key}=", value)
        end
        save #binding.pry
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
end
