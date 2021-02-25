#require 'pry'

class Pokemon
    attr_accessor :name, :id
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
