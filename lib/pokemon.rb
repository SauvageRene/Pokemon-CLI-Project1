require 'pry'

class Pokemon
    
@@all = []

    def initialize(attr_hash) # the hash assigns values to keys so values can be looked up by their key
        attr_hash.each do |key, value|
            self.send("#{key}=", v) if self.respond_to?("#{key}=")
        end
        #binding.pry
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end
end
