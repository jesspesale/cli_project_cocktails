class MakeACocktail::Drink

   @@all = []
   # @@all = [ "LIT", "Baybreeze", "Vodka Soda"]

     attr_accessor :name, :url, :ingredients, :recipe

     def initialize(name)
      @name = name
      save
      #   drink_hash.each do |drink, url|
      #   end
     end

     def self.all
      @@all
      # = MakeACocktail::Scraper.scrape_drinks
     end

     def save
      @@all << self
     end

     def info(drink)
        #shows drinks ingredients and recipe
     end




end