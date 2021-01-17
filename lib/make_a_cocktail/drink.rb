class MakeACocktail::Drink

      @@all = []

      attr_accessor :name, :url, :recipe
      attr_writer :ingredients

      def initialize(name, url)
         @name = name
         @url = url
         save
         @ingredients = []
      #   drink_hash.each do |drink, url|
      #   end
      end

      def self.all
         MakeACocktail::Scraper.scrape_drinks if @@all.empty?
         @@all
      end

      def save
         @@all << self
      end

      def self.ingredients
         # binding.pry
         MakeACocktail::Scraper.scrape_recipe(drink_url) if @ingredients.empty?
         @ingredients
      end

      def info(drink)
        #shows drinks ingredients and recipe
      end




end