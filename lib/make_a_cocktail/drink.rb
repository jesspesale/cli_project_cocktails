class MakeACocktail::Drink

     attr_accessor :name, :url, :ingredients, :recipe

     def initialize(drink_hash)
        drink_hash.each do |drink, url|
        end
     end

     def info(drinnk)
        #shows drinks ingredients and recipe
     end




end